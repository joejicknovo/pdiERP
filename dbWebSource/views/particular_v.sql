CREATE VIEW dbo.particular_v
AS
SELECT        dbo.particular.particular_id, dbo.particular.contract_particular_id, dbo.particular.commercial_condition_id, dbo.particular.division, dbo.commercial_condition.contract_type, 
                         dbo.commercial_condition.advance_payment, dbo.commercial_condition.payment_term_interim_payment, dbo.commercial_condition.payment_term_final_payment, 
                         dbo.particular.payment_unfixed_material_on_site, dbo.commercial_condition.performance_bond, dbo.commercial_condition.retention, dbo.commercial_condition.limit_of_retention, 
                         dbo.commercial_condition.liquidted_damage_penalty, dbo.commercial_condition.limit_penalty, dbo.commercial_condition.maintenance_period
FROM            dbo.particular LEFT OUTER JOIN
                         dbo.commercial_condition ON dbo.particular.commercial_condition_id = dbo.commercial_condition.commercial_condition_id
