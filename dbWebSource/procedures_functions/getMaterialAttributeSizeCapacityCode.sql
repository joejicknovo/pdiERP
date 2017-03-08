
CREATE FUNCTION [dbo].[getMaterialAttributeSizeCapacityCode](
	@id int
) 
RETURNS NVARCHAR(1) 
AS
BEGIN
	DECLARE @code NVARCHAR(1); 

	SELECT @code = material_attribute_size_capacity_code
	FROM dbo.material_attribute_size_capacity
	WHERE material_attribute_size_capacity_id = @id

	RETURN @code;
END;

