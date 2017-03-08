

CREATE PROCEDURE [dbo].[commercial_condition_upd]
(
    @tt    commercial_condition_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,contract_type						= b.contract_type
			,advance_payment					= b.advance_payment
			,payment_term_interim_payment		= b.payment_term_interim_payment
			,payment_term_final_payment			= b.payment_term_final_payment
			,retention							= b.retention
			,limit_of_retention					= b.limit_of_retention
			,liquidted_damage_penalty			= b.liquidted_damage_penalty
			,limit_penalty						= b.limit_penalty
			,maintenance_period					= b.maintenance_period
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.commercial_condition a INNER JOIN @tt b
        ON a.commercial_condition_id = b.commercial_condition_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.contract_type,'')						<> isnull(b.contract_type,'') 
			OR	isnull(a.advance_payment,0)					<> isnull(b.advance_payment,0)
			OR	isnull(a.payment_term_interim_payment,0)		<> isnull(b.payment_term_interim_payment,0)   
			OR	isnull(a.payment_term_final_payment,0)			<> isnull(b.payment_term_final_payment,0) 
			OR	isnull(a.retention,0)							<> isnull(b.retention,0) 
			OR	isnull(a.limit_of_retention,0)					<> isnull(b.limit_of_retention,0) 
			OR	isnull(a.liquidted_damage_penalty,0)			<> isnull(b.liquidted_damage_penalty,0) 
			OR	isnull(a.limit_penalty,0)						<> isnull(b.limit_penalty,0) 
			OR	isnull(a.maintenance_period,0)					<> isnull(b.maintenance_period,0)   
	   )
	   
-- Insert Process

    INSERT INTO commercial_condition (
		 prospective_project_evaluation_id
	    ,contract_type
        ,advance_payment	
		,payment_term_interim_payment	
		,payment_term_final_payment	
		,retention
		,limit_of_retention
		,liquidted_damage_penalty
		,limit_penalty
		,maintenance_period
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,contract_type	
	   ,advance_payment	
	   ,payment_term_interim_payment	
	   ,payment_term_final_payment	
	   ,retention
	   ,limit_of_retention
	   ,liquidted_damage_penalty
	   ,limit_penalty
	   ,maintenance_period
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE commercial_condition_id IS NULL

END


