

CREATE PROCEDURE [dbo].[operation_issue_register_detail_sel]
(
	 @operation_issue_register_id INT = NULL
	,@operation_issue_register_detail_id INT = NULL
	,@is_active CHAR(1) = NULL
	,@user_id  INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = 'SELECT * FROM dbo.operation_issue_register_detail_v WHERE 1 = 1 ';

	IF @operation_issue_register_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND operation_issue_register_id = ' + CAST(@operation_issue_register_id AS NVARCHAR(10)) + ' ';
	END

	IF @operation_issue_register_detail_id IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND operation_issue_register_detail_id = ' + CAST(@operation_issue_register_detail_id AS NVARCHAR(10)) + ' ';
	END
	
	SET @sql = @sql + ' ORDER BY item_sequence';
	EXEC(@sql);		
END
