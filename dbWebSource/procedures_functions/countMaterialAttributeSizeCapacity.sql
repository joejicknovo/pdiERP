
CREATE FUNCTION [dbo].[countMaterialAttributeSizeCapacity](
	@material_type_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.material_attribute_size_capacity 
   WHERE material_type_id = @material_type_id
   AND is_active = 'Y';

   RETURN @count;
END;

