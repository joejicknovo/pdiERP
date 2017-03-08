
CREATE FUNCTION [dbo].[countMaterialLengthWeightRating](
	@material_attribute_size_capacity_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.material_length_weight_rating 
   WHERE material_attribute_size_capacity_id = @material_attribute_size_capacity_id
   AND is_active = 'Y';

   RETURN @count;
END;

