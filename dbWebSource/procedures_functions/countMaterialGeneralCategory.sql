
CREATE FUNCTION [dbo].[countMaterialGeneralCategory](
	@material_classification_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.material_general_category 
   WHERE material_classification_id = @material_classification_id
   AND is_active = 'Y';

   RETURN @count;
END;

