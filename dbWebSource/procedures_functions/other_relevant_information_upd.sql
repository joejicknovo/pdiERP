


CREATE PROCEDURE [dbo].[other_relevant_information_upd]
(
    @tt    other_relevant_information_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,description						= b.description
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.other_relevant_information a INNER JOIN @tt b
        ON a.other_relevant_information_id = b.other_relevant_information_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.description,'')						<> isnull(b.description,'')  
	   )
	   
-- Insert Process

    INSERT INTO other_relevant_information (
		 prospective_project_evaluation_id
	    ,description
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,description	
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE other_relevant_information_id IS NULL

END



