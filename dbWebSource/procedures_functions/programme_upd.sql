
CREATE PROCEDURE [dbo].[programme_upd]
(
    @tt    programme_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,duration							= b.duration
			,prebid_conference					= b.prebid_conference
			,site_inspection					= b.site_inspection
			,bid_submission						= b.bid_submission
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.programme a INNER JOIN @tt b
        ON a.programme_id = b.programme_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.duration,'')							<> isnull(b.duration,'') 
			OR	isnull(a.prebid_conference,'')					<> isnull(b.prebid_conference,'')
			OR	isnull(a.site_inspection,'')					<> isnull(b.site_inspection,'')   
			OR	isnull(a.bid_submission,'')						<> isnull(b.bid_submission,'')   
	   )
	   
-- Insert Process

    INSERT INTO programme (
		 prospective_project_evaluation_id
	    ,duration
        ,prebid_conference	
		,site_inspection	
		,bid_submission	
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,duration	
	   ,prebid_conference	
	   ,site_inspection	
	   ,bid_submission	
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE programme_id IS NULL

END

