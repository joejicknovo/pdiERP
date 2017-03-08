CREATE PROCEDURE [dbo].[material_color_schedule_grade_sel_option]
(
	@user_id int = NULL,
	@material_length_weight_rating_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @orderby	VARCHAR(1000);

	SET @sql = 'SELECT material_color_schedule_grade_id AS value, material_color_schedule_grade_name AS text FROM dbo.material_color_schedule_grade_v WHERE 1 = 1';

	IF @material_length_weight_rating_id IS NOT NULL
	BEGIN
		SET @sql = @sql + ' AND material_length_weight_rating_id =  ' + CAST(@material_length_weight_rating_id AS NVARCHAR(10)) + ' ';
	END
	
	SET @sql = @sql + ' AND is_active = ''Y''';
	SET @sql = @sql + ' ORDER BY material_color_schedule_grade_name';
	EXEC(@sql);		
END
