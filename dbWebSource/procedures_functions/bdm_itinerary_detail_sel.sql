
CREATE PROCEDURE [dbo].[bdm_itinerary_detail_sel]
(
	@user_id int = NULL,
    @bdm_itinerary_id  INT
)
AS
BEGIN
	SET NOCOUNT ON;
  
	SELECT * 
	FROM dbo.bdm_itinerary_detail_v 
	WHERE bdm_itinerary_id = @bdm_itinerary_id
	
END

