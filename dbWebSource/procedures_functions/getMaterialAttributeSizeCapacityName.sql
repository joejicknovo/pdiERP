
CREATE FUNCTION [dbo].[getMaterialAttributeSizeCapacityName](
	@id int
) 
RETURNS NVARCHAR(2000) 
AS
BEGIN
	DECLARE @name NVARCHAR(2000); 

	SELECT @name = material_attribute_size_capacity_name
	FROM dbo.material_attribute_size_capacity
	WHERE material_attribute_size_capacity_id = @id

	RETURN @name;
END;

