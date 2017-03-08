
CREATE FUNCTION [dbo].[countMaterialType](
	@material_item_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.material_type 
   WHERE material_item_id = @material_item_id
   AND is_active = 'Y';

   RETURN @count;
END;

