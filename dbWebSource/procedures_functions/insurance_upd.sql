


CREATE PROCEDURE [dbo].[insurance_upd]
(
    @tt    insurance_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,professional_indemnity_insurance	= b.professional_indemnity_insurance
			,contractor_all_risk_insurance		= b.contractor_all_risk_insurance
			,third_party_liability_insurance	= b.third_party_liability_insurance
			,workmen_compensation_insurance		= b.workmen_compensation_insurance
			,personal_accident					= b.personal_accident
			,automobile_insurance				= b.automobile_insurance
			,marine_insurance					= b.marine_insurance
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.insurance a INNER JOIN @tt b
        ON a.insurance_id = b.insurance_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.professional_indemnity_insurance,0)	<> isnull(b.professional_indemnity_insurance,0) 
			OR	isnull(a.contractor_all_risk_insurance,0)		<> isnull(b.contractor_all_risk_insurance,0)
			OR	isnull(a.third_party_liability_insurance,0)		<> isnull(b.third_party_liability_insurance,0)   
			OR	isnull(a.workmen_compensation_insurance,0)		<> isnull(b.workmen_compensation_insurance,0) 
			OR	isnull(a.personal_accident,0)					<> isnull(b.personal_accident,0) 
			OR	isnull(a.automobile_insurance,0)				<> isnull(b.automobile_insurance,0) 
			OR	isnull(a.marine_insurance,0)					<> isnull(b.marine_insurance,0) 
	   )
	   
-- Insert Process

    INSERT INTO insurance (
		 prospective_project_evaluation_id
	    ,professional_indemnity_insurance
        ,contractor_all_risk_insurance	
		,third_party_liability_insurance	
		,workmen_compensation_insurance	
		,personal_accident
		,automobile_insurance
		,marine_insurance
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,professional_indemnity_insurance	
	   ,contractor_all_risk_insurance	
	   ,third_party_liability_insurance	
	   ,workmen_compensation_insurance	
	   ,personal_accident
	   ,automobile_insurance
	   ,marine_insurance
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE insurance_id IS NULL

END



