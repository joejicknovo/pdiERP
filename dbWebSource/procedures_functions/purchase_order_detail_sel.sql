
CREATE PROCEDURE [dbo].[purchase_order_detail_sel]
(
	@purchase_order_id INT = NULL
	,@purchase_order_detail_id INT = NULL
	,@is_active CHAR(1) = NULL
	,@user_id  INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT * FROM dbo.purchase_order_detail_v WHERE 1 = 1 ';

	IF @purchase_order_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND purchase_order_id = ' + CAST(@purchase_order_id AS NVARCHAR(10)) + ' ';
	END

	IF @purchase_order_detail_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND purchase_order_detail_id = ' + CAST(@purchase_order_detail_id AS NVARCHAR(10)) + ' ';
	END

	IF @is_active IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND is_active = ''' + @is_active + '''';
	END
	
	EXEC(@sql);		
END