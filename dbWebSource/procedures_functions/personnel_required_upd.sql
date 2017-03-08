
CREATE PROCEDURE [dbo].[personnel_required_upd]
(
    @tt    personnel_required_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,project_manager_id					= b.project_manager_id
			,project_engineer_id				= b.project_engineer_id
			,safety_engineer_id					= b.safety_engineer_id
			,material_engineer_id				= b.material_engineer_id
			,others								= b.others
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.personnel_required a INNER JOIN @tt b
        ON a.personnel_required_id = b.personnel_required_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.project_manager_id,0)					<> isnull(b.project_manager_id,0) 
			OR	isnull(a.project_engineer_id,0)					<> isnull(b.project_engineer_id,0)
			OR	isnull(a.safety_engineer_id,0)					<> isnull(b.safety_engineer_id,0)   
			OR	isnull(a.material_engineer_id,0)				<> isnull(b.material_engineer_id,0) 
			OR	isnull(a.others,'')								<> isnull(b.others,'')    
	   )
	   
-- Insert Process

    INSERT INTO personnel_required (
		 prospective_project_evaluation_id
	    ,project_manager_id
        ,project_engineer_id	
		,safety_engineer_id	
		,material_engineer_id	
		,others
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,project_manager_id	
	   ,project_engineer_id	
	   ,safety_engineer_id	
	   ,material_engineer_id	
	   ,others
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE personnel_required_id IS NULL

END



