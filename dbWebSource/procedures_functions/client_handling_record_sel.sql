

CREATE PROCEDURE [dbo].[client_handling_record_sel]
(
	@user_id int = NULL,
    @client_handling_record_id  INT = NULL,
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

	SET @sql = 'SELECT * FROM dbo.client_handling_record_v WHERE 1 = 1 ';
	SELECT @count = COUNT(*) FROM dbo.client_handling_record_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + 'AND reference_code LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + 'OR UPPER(client_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + 'OR UPPER(project_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + 'OR complaint_date LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + 'OR date_informed LIKE ''%' + @search_param + '%'' ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @client_handling_record_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + 'AND client_handling_record_id =  ' + CAST(@client_handling_record_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + 'ORDER BY reference_code DESC';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;	
END

