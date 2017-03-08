
CREATE FUNCTION [dbo].[getMaterialLengthWeightRatingName](
	@id int
) 
RETURNS NVARCHAR(2000) 
AS
BEGIN
	DECLARE @name NVARCHAR(2000); 

	SELECT @name = material_length_weight_rating_name
	FROM dbo.material_length_weight_rating
	WHERE material_length_weight_rating_id = @id

	RETURN @name;
END;

