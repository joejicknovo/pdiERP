
CREATE FUNCTION [dbo].[getMaterialTypeCode](
	@id int
) 
RETURNS NVARCHAR(1) 
AS
BEGIN
	DECLARE @code NVARCHAR(1); 

	SELECT @code = material_type_code 
	FROM dbo.material_type
	WHERE material_type_id = @id

	RETURN @code;
END;

