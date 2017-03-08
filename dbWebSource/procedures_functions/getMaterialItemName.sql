
CREATE FUNCTION [dbo].[getMaterialItemName](
	@id int
) 
RETURNS NVARCHAR(2000) 
AS
BEGIN
	DECLARE @name NVARCHAR(2000); 

	SELECT @name = material_item_name 
	FROM dbo.material_item
	WHERE material_item_id = @id

	RETURN @name;
END;

