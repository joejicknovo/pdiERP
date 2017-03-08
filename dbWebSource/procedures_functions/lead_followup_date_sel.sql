
CREATE PROCEDURE [dbo].[lead_followup_date_sel]
(
    @lead_id  INT = NULL
)
AS
BEGIN

SET NOCOUNT ON

  IF @lead_id IS NOT NULL  
	 SELECT * 
	 FROM dbo.lead_followup_date 
	 WHERE lead_id = @lead_id
	
END

