
create PROCEDURE [dbo].[materials_requisition_slip_detail_detail_sel]
(
	@materials_requisition_slip_id INT = NULL
	,@materials_requisition_slip_detail_id INT = NULL
	,@is_active CHAR(1) = NULL
	,@user_id  INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT * FROM dbo.materials_requisition_slip_detail_v WHERE 1 = 1 ';

	IF @materials_requisition_slip_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND materials_requisition_slip_id = ' + CAST(@materials_requisition_slip_id AS NVARCHAR(10)) + ' ';
	END

	IF @materials_requisition_slip_detail_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND materials_requisition_slip_detail_id = ' + CAST(@materials_requisition_slip_detail_id AS NVARCHAR(10)) + ' ';
	END

	IF @is_active IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND is_active = ''' + @is_active + '''';
	END
	
	SET @sql = @sql + ' ORDER BY item_no';
	EXEC(@sql);		
END