
CREATE PROCEDURE [dbo].[project_upd]
(
    @tt    project_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,project_no							= b.project_no
			,project_name						= b.project_name
			,project_location_id				= b.project_location_id
			,client_id							= b.client_id
			,form_contract						= b.form_contract
			,form_subcontract					= b.form_subcontract
			,system_measurement					= b.system_measurement
			,status_id							= b.status_id
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.project a INNER JOIN @tt b
        ON a.project_id = b.project_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.project_no,'')							<> isnull(b.project_no,'') 
			OR	isnull(a.project_name,'')						<> isnull(b.project_name,'')
			OR	isnull(a.project_location_id,0)					<> isnull(b.project_location_id,0)   
			OR	isnull(a.client_id,0)							<> isnull(b.client_id,0)   
			OR	isnull(a.form_contract,'')						<> isnull(b.form_contract,'')   
			OR	isnull(a.form_subcontract, '')					<> isnull(b.form_subcontract, '')
			OR	isnull(a.system_measurement,'')					<> isnull(b.system_measurement,'')   
			OR	isnull(a.status_id,0)							<> isnull(b.status_id,0) 
	   )
	   
-- Insert Process

    INSERT INTO project (
		 prospective_project_evaluation_id
	    ,project_no
        ,project_name	
		,project_location_id	
		,client_id	
		,form_contract	
		,form_subcontract	
		,system_measurement		
		,status_id	
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,project_no--'EPN' + CONVERT(VARCHAR(10),YEAR(GETDATE())) + REPLICATE('0',4-LEN(RTRIM(@@IDENTITY))) + RTRIM(@@IDENTITY)
	   ,project_name	
	   ,project_location_id	
	   ,client_id	
	   ,form_contract	
	   ,form_subcontract	
	   ,system_measurement		
	   ,status_id
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE project_id IS NULL

END


