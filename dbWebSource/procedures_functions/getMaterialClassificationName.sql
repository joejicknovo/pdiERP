
CREATE FUNCTION [dbo].[getMaterialClassificationName](
	@id int
) 
RETURNS NVARCHAR(2000) 
AS
BEGIN
	DECLARE @name NVARCHAR(2000); 

	SELECT @name = material_classification_name 
	FROM dbo.material_classification
	WHERE material_classification_id = @id

	RETURN @name;
END;

