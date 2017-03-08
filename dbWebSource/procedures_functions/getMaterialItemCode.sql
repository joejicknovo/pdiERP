
CREATE FUNCTION [dbo].[getMaterialItemCode](
	@id int
) 
RETURNS NVARCHAR(1) 
AS
BEGIN
	DECLARE @code NVARCHAR(1); 

	SELECT @code = material_item_code 
	FROM dbo.material_item
	WHERE material_item_id = @id

	RETURN @code;
END;

