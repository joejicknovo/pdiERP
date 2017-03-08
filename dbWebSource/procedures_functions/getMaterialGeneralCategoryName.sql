
CREATE FUNCTION [dbo].[getMaterialGeneralCategoryName](
	@id int
) 
RETURNS NVARCHAR(2000) 
AS
BEGIN
	DECLARE @name NVARCHAR(2000); 

	SELECT @name = material_general_category_name 
	FROM dbo.material_general_category
	WHERE material_general_category_id = @id

	RETURN @name;
END;

