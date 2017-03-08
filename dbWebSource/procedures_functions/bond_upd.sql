
CREATE PROCEDURE [dbo].[bond_upd]
(
    @tt    bond_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,bid_bond							= b.bid_bond
			,performance_bond					= b.performance_bond
			,down_payment_bond					= b.down_payment_bond
			,warranty_bond						= b.warranty_bond
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.bond a INNER JOIN @tt b
        ON a.bond_id = b.bond_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.bid_bond,0)							<> isnull(b.bid_bond,0) 
			OR	isnull(a.performance_bond,0)					<> isnull(b.performance_bond,0)
			OR	isnull(a.down_payment_bond,0)					<> isnull(b.down_payment_bond,0)   
			OR	isnull(a.warranty_bond,0)						<> isnull(b.warranty_bond,0)   
	   )
	   
-- Insert Process

    INSERT INTO bond (
		 prospective_project_evaluation_id
	    ,bid_bond
        ,performance_bond	
		,down_payment_bond	
		,warranty_bond	
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,bid_bond	
	   ,performance_bond	
	   ,down_payment_bond	
	   ,warranty_bond	
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE bond_id IS NULL

END



