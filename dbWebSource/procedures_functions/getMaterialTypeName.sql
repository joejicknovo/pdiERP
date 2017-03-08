
CREATE FUNCTION [dbo].[getMaterialTypeName](
	@id int
) 
RETURNS NVARCHAR(2000) 
AS
BEGIN
	DECLARE @name NVARCHAR(2000); 

	SELECT @name = material_type_name 
	FROM dbo.material_type
	WHERE material_type_id = @id

	RETURN @name;
END;

