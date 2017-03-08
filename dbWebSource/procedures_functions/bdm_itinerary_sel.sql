

CREATE PROCEDURE [dbo].[bdm_itinerary_sel]
(
	@user_id int = NULL,
    @bdm_itinerary_id  INT = NULL,
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

	SET @sql = 'SELECT * FROM dbo.bdm_itinerary_v WHERE 1 = 1 ';
	SELECT @count = COUNT(*) FROM dbo.bdm_itinerary; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND revision_no LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + ' OR effective_date LIKE ''%' + @search_param + '%'' ';
		SET @sql = @sql + ' OR UPPER(status_name) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @bdm_itinerary_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + ' AND bdm_itinerary_id =  ' + CAST(@bdm_itinerary_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + ' ORDER BY revision_no';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;
END

