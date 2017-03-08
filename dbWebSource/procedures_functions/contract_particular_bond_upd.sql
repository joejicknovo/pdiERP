

CREATE PROCEDURE [dbo].[contract_particular_bond_upd]
(
    @tt    contract_particular_bond_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id		= b.contract_particular_id
			,bond_id					= b.bond_id
			,retention_bond				= b.retention_bond
			,updated_by					= @user_id
            ,updated_date				= GETDATE()
     FROM dbo.contract_particular_bond a INNER JOIN @tt b
        ON a.contract_particular_bond_id = b.contract_particular_bond_id 
       WHERE (
				isnull(a.contract_particular_id,0)		<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.bond_id,0)						<> isnull(b.bond_id,0)
			OR	isnull(a.retention_bond,0)				<> isnull(b.retention_bond,0)
	   )
	   
-- Insert Process

    INSERT INTO contract_particular_bond (
		 contract_particular_id
		,bond_id	
		,retention_bond
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
		,bond_id	
		,retention_bond
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE contract_particular_bond_id IS NULL

END


