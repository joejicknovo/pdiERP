
CREATE PROCEDURE [dbo].[contract_particular_sel]
(
	@user_id int = NULL,
	@contract_particular_id INT = NULL,
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

	SET @sql = 'SELECT * FROM dbo.contract_particular_v WHERE 1 = 1';
	SELECT @count = COUNT(*) FROM dbo.contract_particular_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + 'AND project_name LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + 'OR UPPER(effective_date) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @contract_particular_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + 'AND contract_particular_id =  ' + CAST(@contract_particular_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + 'ORDER BY project_name';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;
END


