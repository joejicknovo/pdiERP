


CREATE PROCEDURE [dbo].[prospective_project_evaluation_upd]
(
    @tt    prospective_project_evaluation_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  lead_id									= b.lead_id
			,document_code								= b.document_code
			,revision_no								= b.revision_no
			,effectivity_date							= b.effectivity_date
			,bdm_manager_recommendation_action			= b.bdm_manager_recommendation_action
			,bdm_manager_date_action					= b.bdm_manager_date_action
			,vp_engineering_recommendation_action		= b.vp_engineering_recommendation_action
			,vp_engineering_date_action					= b.vp_engineering_date_action
			,operation_manager_recommendation_action	= b.operation_manager_recommendation_action
			,operation_manager_date_action				= b.operation_manager_date_action
			,president_recommendation_action			= b.president_recommendation_action
			,president_date_action						= b.president_date_action
			,status_id									= b.status_id
			,updated_by									= @user_id
            ,updated_date								= GETDATE()
     FROM dbo.prospective_project_evaluation a INNER JOIN @tt b
        ON a.prospective_project_evaluation_id = b.prospective_project_evaluation_id 
       WHERE (
				isnull(a.lead_id,0)										<> isnull(b.lead_id,0) 
			OR	isnull(a.document_code,'')								<> isnull(b.document_code,'') 
			OR	isnull(a.revision_no,0)									<> isnull(b.revision_no,0) 
			OR	isnull(a.effectivity_date,'')							<> isnull(b.effectivity_date,'')   
			OR	isnull(a.bdm_manager_recommendation_action,'')			<> isnull(b.bdm_manager_recommendation_action,'')
			OR	isnull(a.bdm_manager_date_action,'')					<> isnull(b.bdm_manager_date_action,'')   
			OR	isnull(a.vp_engineering_recommendation_action,'')		<> isnull(b.vp_engineering_recommendation_action,'') 
			OR	isnull(a.vp_engineering_date_action,'')					<> isnull(b.vp_engineering_date_action,'') 
			OR	isnull(a.operation_manager_recommendation_action,'')	<> isnull(b.operation_manager_recommendation_action,'') 
			OR	isnull(a.operation_manager_date_action,'')				<> isnull(b.operation_manager_date_action,'') 
			OR	isnull(a.president_recommendation_action,'')			<> isnull(b.president_recommendation_action,'') 
			OR	isnull(a.president_date_action,'')						<> isnull(b.president_date_action,'')   
			OR	isnull(a.status_id,'')									<> isnull(b.status_id,'')   
	   )
	   
-- Insert Process

    INSERT INTO prospective_project_evaluation (
	     lead_id
		,document_code
		,revision_no
		,effectivity_date
        ,bdm_manager_recommendation_action	
		,bdm_manager_date_action	
		,vp_engineering_recommendation_action	
		,vp_engineering_date_action
		,operation_manager_recommendation_action
		,operation_manager_date_action
		,president_recommendation_action
		,president_date_action
		,status_id
		,created_by
        ,created_date
        )
    SELECT 
	    lead_id	
	   ,document_code
	   ,revision_no
	   ,effectivity_date
	   ,bdm_manager_recommendation_action	
	   ,bdm_manager_date_action	
	   ,vp_engineering_recommendation_action	
	   ,vp_engineering_date_action
	   ,operation_manager_recommendation_action
	   ,operation_manager_date_action
	   ,president_recommendation_action
	   ,president_date_action
	   ,status_id
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE prospective_project_evaluation_id IS NULL

END

