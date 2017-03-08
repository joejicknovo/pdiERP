

CREATE PROCEDURE [dbo].[contract_particular_insurance_upd]
(
    @tt    contract_particular_insurance_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id					= b.contract_particular_id
			,insurance_id							= b.insurance_id
			,pdi_plant_equipment					= b.pdi_plant_equipment
			,updated_by								= @user_id
            ,updated_date							= GETDATE()
     FROM dbo.contract_particular_insurance a INNER JOIN @tt b
        ON a.contract_particular_insurance_id = b.contract_particular_insurance_id 
       WHERE (
				isnull(a.contract_particular_id,0)				<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.insurance_id,0)						<> isnull(b.insurance_id,0)
			OR	isnull(a.pdi_plant_equipment,0)					<> isnull(b.pdi_plant_equipment,0)
	   )
	   
-- Insert Process

    INSERT INTO contract_particular_insurance (
		 contract_particular_id
		,insurance_id	
		,pdi_plant_equipment
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
		,insurance_id	
		,pdi_plant_equipment
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE contract_particular_insurance_id IS NULL

END


