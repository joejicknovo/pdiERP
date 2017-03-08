
CREATE PROCEDURE [dbo].[material_attribute_size_capacity_sel_option]
(
	@user_id int = NULL,
	@material_type_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @orderby	VARCHAR(1000);

	SET @sql = 'SELECT material_attribute_size_capacity_id AS value, material_attribute_size_capacity_name AS text FROM dbo.material_attribute_size_capacity_v WHERE 1 = 1';

	IF @material_type_id IS NOT NULL
	BEGIN
		SET @sql = @sql + ' AND material_type_id =  ' + CAST(@material_type_id AS NVARCHAR(10)) + ' ';
	END
	
	SET @sql = @sql + ' AND is_active = ''Y''';
	SET @sql = @sql + ' ORDER BY material_attribute_size_capacity_name';
	EXEC(@sql);		
END
