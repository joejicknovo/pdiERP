
CREATE FUNCTION [dbo].[getMaterialColorScheduleGradeCode](
	@id int
) 
RETURNS NVARCHAR(1) 
AS
BEGIN
	DECLARE @code NVARCHAR(1); 

	SELECT @code = material_color_schedule_grade_code
	FROM dbo.material_color_schedule_grade
	WHERE material_color_schedule_grade_id = @id

	RETURN @code;
END;

