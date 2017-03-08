CREATE FUNCTION [dbo].[updateMaterialSequence](
	@material_code VARCHAR(11) = NULL,
	@original_material_code VARCHAR(11) = NULL,
	@additional_specification VARCHAR(300) = NULL,
	@material_brand_id INT = 0
) 
RETURNS NVARCHAR(11) 
AS
BEGIN
	DECLARE @code VARCHAR(11);
	DECLARE @isExist CHAR(1);
	DECLARE @sequence NVARCHAR(4); 
	DECLARE @count INT = 0;
	DECLARE @counter INT = 1;
	DECLARE @countResult INT = 0;


	IF @material_code IS NOT NULL
		SET @code = (SELECT TOP 1 material_code 
					 FROM dbo.material 
					 WHERE LEFT(material_code,7) = LEFT(@material_code,7)
					 ORDER BY material_id DESC);

	SET @count = (SELECT COUNT(*) FROM dbo.material WHERE LEFT(material_code,7) = LEFT(@material_code,7));

	WHILE @counter <= @count
	BEGIN
		SET @countResult = (SELECT COUNT(material_code) FROM dbo.material WHERE material_code = LEFT(@material_code,7) + CONCAT('000',@counter));
		IF @countResult = 0
			BREAK;
		SET @counter = @counter + 1;
	END;

	SET @isExist = (SELECT IIF(@material_code = (LEFT(@original_material_code,7) + @additional_specification + CAST(@material_brand_id AS VARCHAR(MAX))),'Y','N'));

	IF @isExist <> 'Y'
		SET @sequence = CONCAT('000',@counter);
	ELSE
		SET @sequence = RIGHT(@original_material_code,4);

	RETURN @sequence;
END;