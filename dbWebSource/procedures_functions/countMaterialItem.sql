
CREATE FUNCTION [dbo].[countMaterialItem](
	@material_general_category_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.material_item 
   WHERE material_general_category_id = @material_general_category_id
   AND is_active = 'Y';

   RETURN @count;
END;

