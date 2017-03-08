

CREATE PROCEDURE [dbo].[material_sel]
(
	@user_id INT					= NULL
    ,@material_id  INT				= NULL
	,@search_param NVARCHAR(MAX)	= NULL
	,@is_active varchar(1)			= NULL
	,@pno INT						= 1
    ,@rpp INT						= 100
	
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @count INT = 0;
	DECLARE @page_count INT = 1;

	SET @sql = 'SELECT * FROM dbo.material_v WHERE 1 = 1 ';
	SELECT @count = COUNT(*) FROM dbo.material_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND UPPER(material_code) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_classification_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_general_category_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_item_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_type_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_attribute_size_capacity_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_length_weight_rating_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_color_schedule_grade_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(additional_specification) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(material_brand_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @material_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + ' AND material_id =  ' + CAST(@material_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
		ELSE IF @is_active IS NOT NULL
		BEGIN
			SET @sql = @sql + ' AND is_active = ''' + @is_active + ''' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + ' ORDER BY material_code';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	--PRINT @sql;
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	PRINT @page_count;
	RETURN @page_count;

END
