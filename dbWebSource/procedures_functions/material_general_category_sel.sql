
CREATE PROCEDURE [dbo].[material_general_category_sel]
(
	@user_id int = NULL,
	@material_general_category_id INT = NULL,
	@material_classification_id INT = NULL,
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

	SET @sql = 'SELECT * FROM dbo.material_general_category_v WHERE 1 = 1';
	SELECT @count = COUNT(*) FROM dbo.material_general_category_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + 'AND material_general_category_code LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + 'OR UPPER(material_general_category_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @material_general_category_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + 'AND material_general_category_id =  ' + CAST(@material_general_category_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
		ELSE IF @material_classification_id IS NOT NULL
		BEGIN
			SET @sql = @sql + 'AND material_classification_id =  ' + CAST(@material_classification_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + 'ORDER BY material_general_category_code';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;
END
