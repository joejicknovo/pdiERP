
CREATE PROCEDURE [dbo].[material_type_sel_option]
(
	@user_id int = NULL,
	@material_item_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @orderby	VARCHAR(1000);

	SET @sql = 'SELECT material_type_id AS value, material_type_name AS text FROM dbo.material_type_v WHERE 1 = 1';

	IF @material_item_id IS NOT NULL
	BEGIN
		SET @sql = @sql + ' AND material_item_id =  ' + CAST(@material_item_id AS NVARCHAR(10)) + ' ';
	END
	
	SET @sql = @sql + ' AND is_active = ''Y''';
	SET @sql = @sql + ' ORDER BY material_type_name';
	EXEC(@sql);		
END
