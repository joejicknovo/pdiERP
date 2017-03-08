
CREATE FUNCTION [dbo].[getMaterialClassificationCode](
	@id int
) 
RETURNS NVARCHAR(1) 
AS
BEGIN
	DECLARE @code NVARCHAR(1); 

	SELECT @code = material_classification_code 
	FROM dbo.material_classification
	WHERE material_classification_id = @id

	RETURN @code;
END;

