
CREATE FUNCTION [dbo].[getMaterialColorScheduleGradeName](
	@id int
) 
RETURNS NVARCHAR(2000) 
AS
BEGIN
	DECLARE @name NVARCHAR(2000); 

	SELECT @name = material_color_schedule_grade_name
	FROM dbo.material_color_schedule_grade
	WHERE material_color_schedule_grade_id = @id

	RETURN @name;
END;

