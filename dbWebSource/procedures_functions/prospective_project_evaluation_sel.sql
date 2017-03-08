
CREATE PROCEDURE [dbo].[prospective_project_evaluation_sel]
(
	@user_id							INT = NULL,
	@prospective_project_evaluation_id	INT= NULL,
	@search_param						NVARCHAR(300) = NULL,
	@col_no								INT	= 1,
	@order_no							INT	= 0,
	@pno								INT = 1,
	@rpp								INT = 20 -- number of rows per page
	
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @stmt		VARCHAR(4000);
	DECLARE @order      VARCHAR(4000);
	DECLARE @count		INT = 0;
	DECLARE @page_count INT = 1;

	SET @stmt = 'SELECT * FROM dbo.prospective_project_evaluation WHERE 1 = 1';
	SET @order = N' ORDER BY ' + CAST(@col_no AS VARCHAR(1)) + ' ' + IIF(@order_no=0,'ASC','DESC');
	SELECT @count = COUNT(*) FROM dbo.prospective_project_evaluation; 

	IF @prospective_project_evaluation_id IS NOT NULL
		BEGIN
			SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));
			SET @count = 1;
		END

	IF @search_param IS NOT NULL
		BEGIN
			SET @stmt = @stmt + ' AND UPPER(project_name) LIKE UPPER(''%' + @search_param + '%'') ';
			SET @stmt = @stmt + ' OR UPPER(revision_no) LIKE UPPER(''%' + @search_param + '%'') ';
			SET @stmt = @stmt + ' OR UPPER(effectivity_date) LIKE UPPER(''%' + @search_param + '%'') ';
			SET @count = 1;
		END
	
	SET @stmt = @stmt + @order
	SET @stmt = @stmt + N' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	--PRINT(@stmt);
	EXEC(@stmt);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	--PRINT @page_count;
	RETURN @page_count;
END

