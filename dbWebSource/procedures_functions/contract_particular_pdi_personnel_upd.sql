

CREATE PROCEDURE [dbo].[contract_particular_pdi_personnel_upd]
(
    @tt    contract_particular_pdi_personnel_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id					= b.contract_particular_id
			,personnel_required_id					= b.personnel_required_id
			,contract_administrator_id				= b.contract_administrator_id
			,updated_by								= @user_id
            ,updated_date							= GETDATE()
     FROM dbo.contract_particular_pdi_personnel a INNER JOIN @tt b
        ON a.pdi_personnel_id = b.pdi_personnel_id 
       WHERE (
				isnull(a.contract_particular_id,0)		<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.personnel_required_id,0)		<> isnull(b.personnel_required_id,0)
			OR	isnull(a.contract_administrator_id,0)	<> isnull(b.contract_administrator_id,0)
	   )
	   
-- Insert Process

    INSERT INTO contract_particular_pdi_personnel (
		 contract_particular_id
		,personnel_required_id	
		,contract_administrator_id
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
		,personnel_required_id	
		,contract_administrator_id
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE pdi_personnel_id IS NULL

END


