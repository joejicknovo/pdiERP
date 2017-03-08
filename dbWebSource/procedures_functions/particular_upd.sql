

CREATE PROCEDURE [dbo].[particular_upd]
(
    @tt    particular_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id				= b.contract_particular_id
			,commercial_condition_id			= b.commercial_condition_id
			,division							= b.division
			,payment_unfixed_material_on_site	= b.payment_unfixed_material_on_site
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.particular a INNER JOIN @tt b
        ON a.particular_id = b.particular_id 
       WHERE (
				isnull(a.contract_particular_id,0)				<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.commercial_condition_id,0)				<> isnull(b.commercial_condition_id,0) 
			OR	isnull(a.division,'')							<> isnull(b.division,'')
			OR	isnull(a.payment_unfixed_material_on_site,0)	<> isnull(b.payment_unfixed_material_on_site,0)  
	   )
	   
-- Insert Process

    INSERT INTO particular (
		 contract_particular_id
	    ,commercial_condition_id
        ,division	
		,payment_unfixed_material_on_site	
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
	    ,commercial_condition_id
        ,division	
		,payment_unfixed_material_on_site	
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE particular_id IS NULL

END


