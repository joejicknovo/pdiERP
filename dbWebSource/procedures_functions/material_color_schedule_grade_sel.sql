
CREATE PROCEDURE [dbo].[material_color_schedule_grade_sel]
(
	@user_id int = NULL,
	@material_color_schedule_grade_id INT = NULL,
	@material_length_weight_rating_id INT = NULL,
	@search_param NVARCHAR(MAX) = NULL,
	@pno INT = 1,
	@rpp INT = 20 -- number of rows per page
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @count INT = 0;
	DECLARE @page_count INT = 1;
	DECLARE @orderby	VARCHAR(1000);

	SET @sql = 'SELECT * FROM dbo.material_color_schedule_grade WHERE 1 = 1';
	SELECT @count = COUNT(*) FROM dbo.material_color_schedule_grade; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + 'AND material_color_schedule_grade_code LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + 'OR UPPER(material_color_schedule_grade_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @material_color_schedule_grade_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + 'AND material_color_schedule_grade_id =  ' + CAST(@material_color_schedule_grade_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
		ELSE IF @material_length_weight_rating_id IS NOT NULL
		BEGIN
			SET @sql = @sql + 'AND material_length_weight_rating_id =  ' + CAST(@material_length_weight_rating_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + 'ORDER BY material_color_schedule_grade_code';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;
END
