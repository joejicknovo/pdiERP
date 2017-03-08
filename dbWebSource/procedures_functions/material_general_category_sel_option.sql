
CREATE PROCEDURE [dbo].[material_general_category_sel_option]
(
	@user_id int = NULL,
	@material_classification_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @orderby	VARCHAR(1000);

	SET @sql = 'SELECT material_general_category_id AS value, material_general_category_name AS text FROM dbo.material_general_category_v WHERE 1 = 1 ';

	IF @material_classification_id IS NOT NULL
	BEGIN
		SET @sql = @sql + ' AND material_classification_id =  ' + CAST(@material_classification_id AS NVARCHAR(10)) + ' ';
	END
	
	SET @sql = @sql + ' AND is_active = ''Y''';
	SET @sql = @sql + ' ORDER BY material_general_category_name';
	EXEC(@sql);		

END
