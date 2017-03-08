
CREATE FUNCTION [dbo].[getMaterialBrandName](
	@material_brand_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_name VARCHAR(100); 

   SELECT @l_name = material_brand_name 
   FROM dbo.material_brand
   WHERE material_brand_id = @material_brand_id
   AND is_active = 'Y'

   RETURN @l_name;
END;
