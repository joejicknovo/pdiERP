
CREATE PROCEDURE [dbo].[warehousing_direct_sel]
(
	@user_id int = NULL,
    @warehousing_detail_id  INT = NULL,
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

	SET @sql = 'SELECT * FROM dbo.warehousing_direct_v WHERE 1 = 1 ';
	SELECT @count = COUNT(*) FROM dbo.warehousing_direct_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND UPPER(material_code) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR quantity LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + ' OR UPPER(warehouse_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(warehouse_rack_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(tag_no) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR expiration_date LIKE ''%' + @search_param + '%'' ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @warehousing_detail_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + ' AND warehousing_detail_id =  ' + CAST(@warehousing_detail_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + ' ORDER BY material_code';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;
END


