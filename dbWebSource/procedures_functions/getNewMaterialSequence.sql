CREATE FUNCTION [dbo].[getNewMaterialSequence](
	@material_code VARCHAR(11) = NULL
) 
RETURNS NVARCHAR(11) 
AS
BEGIN
	DECLARE @code VARCHAR(11);
	DECLARE @sequence NVARCHAR(4); 


	IF @material_code IS NOT NULL
		SET @code = (SELECT TOP 1 material_code FROM dbo.material WHERE LEFT(material_code,7) = @material_code ORDER BY material_id DESC);

	SET @sequence = (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((SELECT RIGHT(@code,4)) AS INT)) + 1, '1')), 4));

	RETURN @sequence;
END;