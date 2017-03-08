CREATE VIEW dbo.contract_particular_insurance_v
AS
SELECT        dbo.contract_particular_insurance.contract_particular_insurance_id, dbo.contract_particular_insurance.contract_particular_id, dbo.contract_particular_insurance.insurance_id, 
                         dbo.insurance.professional_indemnity_insurance, dbo.insurance.contractor_all_risk_insurance, dbo.insurance.third_party_liability_insurance, dbo.insurance.workmen_compensation_insurance, 
                         dbo.contract_particular_insurance.pdi_plant_equipment
FROM            dbo.contract_particular_insurance LEFT OUTER JOIN
                         dbo.insurance ON dbo.contract_particular_insurance.insurance_id = dbo.insurance.insurance_id
