
CREATE PROCEDURE [dbo].[product_service_performance_sel]
(
    @product_service_performance_id  INT = NULL,
	@is_active CHAR(1) = NULL
)
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT * FROM dbo.product_service_performance WHERE 1 = 1 ';

	IF @product_service_performance_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND product_service_performance_id = ' + CAST(@product_service_performance_id AS NVARCHAR(10)) + ' ';
	END

	IF @is_active IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND is_active = ''' + @is_active + '''';
	END

	SET @sql = @sql + ' ORDER BY seq_no';

	print (@sql);
	EXEC(@sql);
	
END

