
CREATE FUNCTION [dbo].[getMaterialGeneralCategoryCode](
	@id int
) 
RETURNS NVARCHAR(1) 
AS
BEGIN
	DECLARE @code NVARCHAR(1); 

	SELECT @code = material_general_category_code 
	FROM dbo.material_general_category
	WHERE material_general_category_id = @id

	RETURN @code;
END;

