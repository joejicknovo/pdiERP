


CREATE PROCEDURE [dbo].[material_upd]
(
    @tt    material_tt READONLY
   ,@user_id INT
)
AS

BEGIN
	CREATE TABLE #updTempMaterial (
		 material_id INT
		,material_code VARCHAR(11)
		,material_classification_id INT
		,material_general_category_id INT
		,material_item_id INT
		,material_type_id INT
		,material_attribute_size_capacity_id INT
		,material_length_weight_rating_id INT
		,material_color_schedule_grade_id INT
		,additional_specification VARCHAR(300)
		,material_brand_id INT
		,unit_of_measure_id INT
		,image_filename  VARCHAR(15)
		,is_active CHAR(1)
	);

	INSERT INTO #updTempMaterial
	SELECT * FROM @tt;

	DECLARE @compareCode VARCHAR(MAX);
	DECLARE @isSameSevenCode CHAR(1);
	DECLARE @countDuplicate INT;

	SET @compareCode = (SELECT IIF(material_classification_id IS NOT NULL, dbo.getMaterialClassificationCode(material_classification_id), 'O') + 
								IIF(material_general_category_id IS NOT NULL, dbo.getMaterialGeneralCategoryCode(material_general_category_id), 'O') +
								IIF(material_item_id IS NOT NULL, dbo.getMaterialItemCode(material_item_id), 'O') +
								IIF(material_type_id IS NOT NULL, dbo.getMaterialTypeCode(material_type_id), 'O') + 
								IIF(material_attribute_size_capacity_id IS NOT NULL, dbo.getMaterialAttributeSizeCapacityCode(material_attribute_size_capacity_id), 'O') +
								IIF(material_length_weight_rating_id IS NOT NULL, dbo.getMaterialLengthWeightRatingCode(material_length_weight_rating_id), 'O') +
								IIF(material_color_schedule_grade_id IS NOT NULL, dbo.getMaterialColorScheduleGradeCode(material_color_schedule_grade_id), 'O') +
								IIF(additional_specification IS NOT NULL, REPLACE(additional_specification, ' ', ''),'') +
								IIF(material_brand_id IS NOT NULL, CAST(material_brand_id AS VARCHAR(50)), '')
						FROM #updTempMaterial);

	--Validate duplicate material code.
	SELECT @countDuplicate = COUNT(*)
	FROM dbo.material 
	WHERE (LEFT(material_code,7) + '' + REPLACE(additional_specification, ' ', '') + '' + CAST(material_brand_id AS VARCHAR(50))) = @compareCode

	IF @countDuplicate = 0
		SET @isSameSevenCode = (SELECT IIF(LEFT(material_code,7) = LEFT(@compareCode,7),'Y','N')
								FROM dbo.material 
								WHERE material_id = 1)
	ELSE
		SET @isSameSevenCode = 'Y'

	--Update Process
	IF @countDuplicate = 0
		UPDATE 
			a 
		SET  material_code							= IIF(@isSameSevenCode = 'N',(SELECT LEFT(@compareCode,7) + dbo.updateMaterialSequence(@compareCode,b.material_code,b.additional_specification,b.material_brand_id)),b.material_code)
			,material_classification_id	            = b.material_classification_id
			,material_general_category_id			= b.material_general_category_id
			,material_item_id						= b.material_item_id
			,material_type_id						= b.material_type_id
			,material_attribute_size_capacity_id	= b.material_attribute_size_capacity_id
			,material_length_weight_rating_id       = b.material_length_weight_rating_id
			,material_color_schedule_grade_id		= b.material_color_schedule_grade_id
			,additional_specification				= b.additional_specification
			,material_brand_id						= b.material_brand_id
			,unit_of_measure_id						= b.unit_of_measure_id
			,image_filename							= b.image_filename
			,is_active								= b.is_active
			,updated_by								= @user_id
			,updated_date							= GETDATE()
		FROM dbo.material a 
		INNER JOIN #updTempMaterial b ON a.material_id = b.material_id
	ELSE
		RETURN (SELECT ' Duplicate Found: ' + 'Already exist in the database.' AS duplicateResult);

	DROP TABLE #updTempMaterial

--INSERT NEW CODE GENERATOR & VALIDATION
	BEGIN
		CREATE TABLE #tempMaterial (
			 material_classification_id INT
			,material_general_category_id INT
			,material_item_id INT
			,material_type_id INT
			,material_attribute_size_capacity_id INT
			,material_length_weight_rating_id INT
			,material_color_schedule_grade_id INT
			,additional_specification VARCHAR(300)
			,material_brand_id INT
			,unit_of_measure_id INT
			,image_filename  VARCHAR(15)
			,is_active CHAR(1)
			,created_by INT
			,created_date DATETIME
			);

		INSERT INTO #tempMaterial
		SELECT material_classification_id
			  ,material_general_category_id	
			  ,material_item_id
			  ,material_type_id
			  ,material_attribute_size_capacity_id
			  ,material_length_weight_rating_id
			  ,material_color_schedule_grade_id
			  ,additional_specification
			  ,material_brand_id
			  ,unit_of_measure_id
			  ,image_filename 
		      ,is_active
		      ,@user_id
		      ,GETDATE()
		FROM @tt
		WHERE material_id IS NULL;


		DECLARE @saveToCompare VARCHAR(3000);
		DECLARE @codeToCompare VARCHAR(3000);
		SET @saveToCompare = (SELECT IIF(material_classification_id IS NOT NULL, dbo.getMaterialClassificationCode(material_classification_id), 'O') + 
									 IIF(material_general_category_id IS NOT NULL, dbo.getMaterialGeneralCategoryCode(material_general_category_id), 'O') +
									 IIF(material_item_id IS NOT NULL, dbo.getMaterialItemCode(material_item_id), 'O') +
									 IIF(material_type_id IS NOT NULL, dbo.getMaterialTypeCode(material_type_id), 'O') + 
									 IIF(material_attribute_size_capacity_id IS NOT NULL, dbo.getMaterialAttributeSizeCapacityCode(material_attribute_size_capacity_id), 'O') +
									 IIF(material_length_weight_rating_id IS NOT NULL, dbo.getMaterialLengthWeightRatingCode(material_length_weight_rating_id), 'O') +
									 IIF(material_color_schedule_grade_id IS NOT NULL, dbo.getMaterialColorScheduleGradeCode(material_color_schedule_grade_id), 'O') +
									 IIF(additional_specification IS NOT NULL, REPLACE(additional_specification, ' ', ''),'') +
									 IIF(material_brand_id IS NOT NULL, CAST(material_brand_id AS VARCHAR(50)), '')
							  FROM #tempMaterial);

		CREATE TABLE #tempToCompare(material_description NVARCHAR(3000));

		INSERT INTO #tempToCompare
		SELECT LEFT(material_code,7) + 
			   IIF(additional_specification IS NOT NULL, REPLACE(additional_specification, ' ', ''),'') +
			   IIF(material_brand_id IS NOT NULL, CAST(material_brand_id AS VARCHAR(50)), '') AS material_description
		FROM dbo.material;

		DECLARE @validationResult VARCHAR(3000);

		SET @validationResult = (SELECT DISTINCT material_description 
								 FROM #tempToCompare 
								 WHERE material_description = @saveToCompare);

		DECLARE @isDuplicate AS CHAR(3);

		SET @isDuplicate = (SELECT IIF(@validationResult IS NOT NULL,'YES','NO'));

		DROP TABLE #tempToCompare;

		--INSERT NEW CODE GENERATOR
		DECLARE @codeGenerated	VARCHAR(11);
		DECLARE @stmt			VARCHAR(4000);

		IF @isDuplicate <> 'YES'
			SET @codeGenerated = (SELECT LEFT(@saveToCompare,7) + dbo.getNewMaterialSequence(LEFT(@saveToCompare,7)));
		ELSE
			--SET @stmt = 'SELECT ''' + LEFT(@validationResult, LEN(@validationResult) - 1);
			--SET @stmt = @stmt + ' Already exist in the database.''';
			--EXEC (@stmt); 
			RETURN (SELECT LEFT(@validationResult, LEN(@validationResult) - 1) + ' Duplicate Found: ' + 'Already exist in the database.' AS duplicateResult);
			
		--Insert Process
		IF @isDuplicate <> 'YES'
			INSERT INTO material (
				 material_code
				,material_classification_id
				,material_general_category_id	
				,material_item_id
				,material_type_id
				,material_attribute_size_capacity_id
				,material_length_weight_rating_id
				,material_color_schedule_grade_id
				,additional_specification
				,material_brand_id
				,unit_of_measure_id
				,image_filename
				,is_active
				,created_by
				,created_date
				)
			SELECT @codeGenerated AS material_code, * FROM #tempMaterial;

		DROP TABLE #tempMaterial;

	END
	
END


