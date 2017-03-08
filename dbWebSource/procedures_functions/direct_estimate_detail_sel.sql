
CREATE PROCEDURE [dbo].[direct_estimate_detail_sel]
(
	@direct_estimate_id INT = NULL
	,@direct_estimate_detail_id INT = NULL
	,@is_active CHAR(1) = NULL
	,@user_id  INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT * FROM dbo.direct_estimate_detail_v WHERE 1 = 1 ';

	IF @direct_estimate_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND direct_estimate_id = ' + CAST(@direct_estimate_id AS NVARCHAR(10)) + ' ';
	END

	IF @direct_estimate_detail_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND direct_estimate_detail_id = ' + CAST(@direct_estimate_detail_id AS NVARCHAR(10)) + ' ';
	END

	IF @is_active IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND is_active = ''' + @is_active + '''';
	END
	
	SET @sql = @sql + ' ORDER BY item_seq_number';
	EXEC(@sql);		
END