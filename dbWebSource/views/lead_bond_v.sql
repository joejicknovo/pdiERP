CREATE VIEW dbo.lead_bond_v
AS
SELECT        dbo.prospective_project_evaluation.lead_id, dbo.bond.bond_id, dbo.bond.prospective_project_evaluation_id, dbo.bond.bid_bond, dbo.bond.performance_bond, dbo.bond.down_payment_bond, 
                         dbo.bond.warranty_bond
FROM            dbo.bond LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.bond.prospective_project_evaluation_id = dbo.prospective_project_evaluation.prospective_project_evaluation_id
