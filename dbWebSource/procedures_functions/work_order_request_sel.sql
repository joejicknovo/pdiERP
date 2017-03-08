

CREATE PROCEDURE [dbo].[work_order_request_sel]
(
	@user_id int = NULL,
	@work_order_request_id INT = NULL,
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

	SET @sql = ' SELECT * FROM dbo.work_order_request_v WHERE 1 = 1 ';
	SELECT @count = COUNT(*) FROM dbo.work_order_request_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND work_order_request_date LIKE ''%' + @search_param + '%'' '
		SET @sql = @sql + ' OR UPPER(department_name) LIKE UPPER(''%' + @search_param + '%'') '
		SET @sql = @sql + ' OR UPPER(client_name) LIKE UPPER(''%' + @search_param + '%'') '
		SET @sql = @sql + ' OR UPPER(project_name) LIKE UPPER(''%' + @search_param + '%'') '
		SET @sql = @sql + ' OR UPPER(type_of_work_name) LIKE UPPER(''%' + @search_param + '%'') '
		SET @sql = @sql + ' OR requested_date LIKE ''%' + @search_param + '%'' '
		SET @sql = @sql + ' OR UPPER(status_name) LIKE UPPER(''%' + @search_param + '%'') '
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @work_order_request_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + ' AND work_order_request_id =  ' + CAST(@work_order_request_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + ' ORDER BY effective_date';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;

END
