

CREATE PROCEDURE [dbo].[contract_particular_project_upd]
(
    @tt    contract_particular_project_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id				= b.contract_particular_id
			,project_id							= b.project_id
			,pdi_project_no						= b.pdi_project_no
			,project_description				= b.project_description
			,main_contractor_id					= b.main_contractor_id
			,engineer_id						= b.engineer_id
			,pdi_role_on_project_id				= b.pdi_role_on_project_id
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.contract_particular_project a INNER JOIN @tt b
        ON a.contract_particular_project_id = b.contract_particular_project_id 
       WHERE (
				isnull(a.contract_particular_id,0)			<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.project_id,0)						<> isnull(b.project_id,0) 
			OR	isnull(a.pdi_project_no,'')					<> isnull(b.pdi_project_no,'')
			OR	isnull(a.project_description,'')			<> isnull(b.project_description,'')   
			OR	isnull(a.main_contractor_id,0)				<> isnull(b.main_contractor_id,0) 
			OR	isnull(a.engineer_id,0)						<> isnull(b.engineer_id,0) 
			OR	isnull(a.pdi_role_on_project_id,0)			<> isnull(b.pdi_role_on_project_id,0) 
	   )
	   
-- Insert Process

    INSERT INTO contract_particular_project (
		 contract_particular_id
	    ,project_id
        ,pdi_project_no	
		,project_description	
		,main_contractor_id	
		,engineer_id
		,pdi_role_on_project_id
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
	    ,project_id
        ,pdi_project_no	
		,project_description	
		,main_contractor_id	
		,engineer_id
		,pdi_role_on_project_id
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE contract_particular_project_id IS NULL

END


