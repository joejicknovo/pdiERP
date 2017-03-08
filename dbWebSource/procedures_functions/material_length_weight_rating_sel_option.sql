
CREATE PROCEDURE [dbo].[material_length_weight_rating_sel_option]
(
	@user_id int = NULL,
	@material_attribute_size_capacity_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @orderby	VARCHAR(1000);

	SET @sql = 'SELECT material_length_weight_rating_id AS value, material_length_weight_rating_name AS text FROM dbo.material_length_weight_rating_v WHERE 1 = 1';

	IF @material_attribute_size_capacity_id IS NOT NULL
	BEGIN
		SET @sql = @sql + ' AND material_attribute_size_capacity_id =  ' + CAST(@material_attribute_size_capacity_id AS NVARCHAR(10)) + ' ';
	END
	
	SET @sql = @sql + ' AND is_active = ''Y''';
	SET @sql = @sql + ' ORDER BY material_length_weight_rating_name';
	EXEC(@sql);		
END
