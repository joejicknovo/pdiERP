
CREATE PROCEDURE [dbo].[material_code_update_by_color_schedule_grade]
(
	@tt    material_code_update_by_color_schedule_grade_tt READONLY
	, @user_id int
)
AS

BEGIN
	SET NOCOUNT ON;
	DECLARE @tmp_material TABLE
	(
	  material_id INT, 
	  material_code NVARCHAR(15)
	);
	DECLARE @ttt TABLE
	(
	  material_color_schedule_grade_id INT, 
	  material_color_schedule_grade_code NVARCHAR(15)
	);

	DECLARE @material_color_schedule_grade_id INT;
	DECLARE @m_code NVARCHAR(15);

	INSERT INTO @ttt SELECT * FROM @tt WHERE material_color_schedule_grade_id IS NOT NULL;

	WHILE EXISTS(SELECT * FROM @ttt)
	BEGIN
		SELECT TOP 1 @material_color_schedule_grade_id = material_color_schedule_grade_id FROM @ttt;
		SELECT TOP 1 @m_code = material_color_schedule_grade_code FROM @ttt;
	
		INSERT INTO @tmp_material (material_id, material_code)
		SELECT material_id, STUFF(material_code, 7, 1, @m_code) AS material_code
		FROM material
		WHERE material_color_schedule_grade_id = @material_color_schedule_grade_id;

		DECLARE @material_id INT;
		DECLARE @material_code NVARCHAR(15);
		WHILE EXISTS(SELECT * FROM @tmp_material)
		BEGIN
			SELECT TOP 1 @material_id = material_id FROM @tmp_material;
			SELECT @material_code = material_code FROM @tmp_material WHERE material_id = @material_id;
			UPDATE material SET material_code = @material_code WHERE material_id = @material_id;
			DELETE @tmp_material WHERE material_id = @material_id;
		End
		DELETE @ttt WHERE material_color_schedule_grade_id = @material_color_schedule_grade_id;
		DELETE FROM @tmp_material;
	END
END
