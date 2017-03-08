
CREATE PROCEDURE [dbo].[material_item_sel_option]
(
	@user_id int = NULL,
	@material_general_category_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @orderby	VARCHAR(1000);

	SET @sql = 'SELECT material_item_id AS value, material_item_name AS text FROM dbo.material_item_v WHERE 1 = 1';

	IF @material_general_category_id IS NOT NULL
	BEGIN
		SET @sql = @sql + ' AND material_general_category_id =  ' + CAST(@material_general_category_id AS NVARCHAR(10)) + ' ';
	END

	SET @sql = @sql + ' AND is_active = ''Y''';
	SET @sql = @sql + ' ORDER BY material_item_name';
	EXEC(@sql);		

END
