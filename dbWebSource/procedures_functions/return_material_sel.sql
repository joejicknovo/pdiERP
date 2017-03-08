
CREATE PROCEDURE [dbo].[return_material_sel]
(
	@user_id int = NULL,
    @return_material_id  INT = NULL,
	@search_param NVARCHAR(1000) = NULL,
	@pno INT = 1,
	@rpp INT = 20 -- number of rows per page
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @count INT = 0;
	DECLARE @page_count INT = 1;

	SET @sql = 'SELECT * FROM dbo.return_material_v WHERE 1 = 1 ';
	SELECT @count = COUNT(*) FROM dbo.return_material_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND reference_no LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + ' OR UPPER(return_to) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(return_from) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(project_code) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @return_material_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + ' AND return_material_id =  ' + CAST(@return_material_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + ' ORDER BY reference_no';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;
END


