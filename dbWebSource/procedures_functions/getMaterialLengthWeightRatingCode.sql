
CREATE FUNCTION [dbo].[getMaterialLengthWeightRatingCode](
	@id int
) 
RETURNS NVARCHAR(1) 
AS
BEGIN
	DECLARE @code NVARCHAR(1); 

	SELECT @code = material_length_weight_rating_code
	FROM dbo.material_length_weight_rating
	WHERE material_length_weight_rating_id = @id

	RETURN @code;
END;

