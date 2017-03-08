
CREATE PROCEDURE [dbo].[lead_followup_date_upd]
(
    @tt    lead_followup_date_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  followup_date		= b.followup_date
			,reminder			= b.reminder
            ,updated_by			= @user_id
            ,updated_date		= GETDATE()
     FROM dbo.lead_followup_date a INNER JOIN @tt b
        ON a.lead_followup_id = b.lead_followup_id 
       WHERE (
			isnull(a.followup_date,'')	<> isnull(b.followup_date,'')
			OR isnull(a.reminder,'')		<> isnull(b.reminder,'')    
	   )
	   
-- Insert Process
    INSERT INTO lead_followup_date (
         lead_id
		,followup_date
		,reminder
        ,created_by
        ,created_date
        )
    SELECT 
        lead_id
	   ,followup_date
	   ,reminder
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE lead_followup_id IS NULL;
END



