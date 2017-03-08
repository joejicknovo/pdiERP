CREATE VIEW dbo.lead_commercial_condition_v
AS
SELECT        dbo.prospective_project_evaluation.lead_id, dbo.commercial_condition.commercial_condition_id, dbo.commercial_condition.prospective_project_evaluation_id, dbo.commercial_condition.contract_type, 
                         dbo.commercial_condition.advance_payment, dbo.commercial_condition.payment_term_interim_payment, dbo.commercial_condition.payment_term_final_payment, dbo.commercial_condition.performance_bond, 
                         dbo.commercial_condition.retention, dbo.commercial_condition.limit_of_retention, dbo.commercial_condition.liquidted_damage_penalty, dbo.commercial_condition.limit_penalty, 
                         dbo.commercial_condition.maintenance_period
FROM            dbo.commercial_condition LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.commercial_condition.prospective_project_evaluation_id = dbo.prospective_project_evaluation.prospective_project_evaluation_id
