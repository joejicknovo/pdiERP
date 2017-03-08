
create FUNCTION [dbo].[countDirectEstimateDetails](
	@direct_estimate_id INT
) 
RETURNS INT 
AS
BEGIN
	DECLARE @count INT;

	SELECT 
		@count = COUNT(*) 
	FROM 
		dbo.direct_estimate_detail_v 
	WHERE 
		1 = 1
	AND
		direct_estimate_id = @direct_estimate_id;

	RETURN @count;
END;

