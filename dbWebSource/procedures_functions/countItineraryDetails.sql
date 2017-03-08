
CREATE FUNCTION [dbo].[countItineraryDetails](
	@bdm_itinerary_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.bdm_itinerary_detail
   WHERE bdm_itinerary_id = @bdm_itinerary_id;

   RETURN @count;
END;

