
CREATE FUNCTION [dbo].[countMaterialColorScheduleGrade](
	@material_length_weight_rating_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.material_color_schedule_grade 
   WHERE material_length_weight_rating_id = @material_length_weight_rating_id
   AND is_active = 'Y';

   RETURN @count;
END;

