CREATE VIEW dbo.lead_insurance_v
AS
SELECT        dbo.prospective_project_evaluation.lead_id, dbo.insurance.insurance_id, dbo.insurance.prospective_project_evaluation_id, dbo.insurance.professional_indemnity_insurance, 
                         dbo.insurance.contractor_all_risk_insurance, dbo.insurance.third_party_liability_insurance, dbo.insurance.workmen_compensation_insurance, dbo.insurance.personal_accident, 
                         dbo.insurance.automobile_insurance, dbo.insurance.marine_insurance
FROM            dbo.insurance LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.insurance.prospective_project_evaluation_id = dbo.prospective_project_evaluation.prospective_project_evaluation_id
