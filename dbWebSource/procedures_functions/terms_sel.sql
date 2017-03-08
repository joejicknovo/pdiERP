
CREATE PROCEDURE [dbo].[terms_sel]
(
    @term_id  INT = NULL,
	@is_active CHAR(1) = NULL
)
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT * FROM dbo.terms_v WHERE 1 = 1 ';

	IF @term_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND term_id = ' + CAST(@term_id AS NVARCHAR(10)) + ' ';
	END

	IF @is_active IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND is_active = ''' + @is_active + '''';
	END

	SET @sql = @sql + ' ORDER BY term';

	print (@sql);
	EXEC(@sql);
	
END
