CREATE VIEW dbo.prospective_project_evaluation_sel_option_v
AS
SELECT        dbo.project.project_id, dbo.project.project_name, dbo.project.project_no, dbo.getProjectLocation(dbo.project.project_location_id) AS project_location, dbo.getClientName(dbo.project.client_id) AS employer_name, 
                         dbo.project.form_contract, dbo.project.form_subcontract, dbo.project.system_measurement, dbo.commercial_condition.commercial_condition_id, dbo.commercial_condition.contract_type, 
                         dbo.commercial_condition.advance_payment, dbo.commercial_condition.payment_term_interim_payment, dbo.commercial_condition.payment_term_final_payment, 
                         dbo.commercial_condition.performance_bond AS commercial_condition_performance_bond, dbo.commercial_condition.retention, dbo.commercial_condition.limit_of_retention, 
                         dbo.commercial_condition.liquidted_damage_penalty, dbo.commercial_condition.limit_penalty, dbo.commercial_condition.maintenance_period, dbo.programme.programme_id, dbo.programme.duration, 
                         dbo.personnel_required.personnel_required_id, dbo.getProjectManagerName(dbo.personnel_required.project_manager_id) AS project_manager, 
                         dbo.getProjectEngineerName(dbo.personnel_required.project_engineer_id) AS project_engineer, dbo.bond.bond_id, dbo.bond.performance_bond, dbo.bond.down_payment_bond, dbo.insurance.insurance_id, 
                         dbo.insurance.professional_indemnity_insurance, dbo.insurance.contractor_all_risk_insurance, dbo.insurance.third_party_liability_insurance, dbo.insurance.workmen_compensation_insurance
FROM            dbo.project INNER JOIN
                         dbo.commercial_condition ON dbo.project.prospective_project_evaluation_id = dbo.commercial_condition.prospective_project_evaluation_id INNER JOIN
                         dbo.programme ON dbo.project.prospective_project_evaluation_id = dbo.programme.prospective_project_evaluation_id INNER JOIN
                         dbo.personnel_required ON dbo.project.prospective_project_evaluation_id = dbo.personnel_required.prospective_project_evaluation_id INNER JOIN
                         dbo.bond ON dbo.project.prospective_project_evaluation_id = dbo.bond.prospective_project_evaluation_id INNER JOIN
                         dbo.insurance ON dbo.project.prospective_project_evaluation_id = dbo.insurance.prospective_project_evaluation_id
