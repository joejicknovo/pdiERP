CREATE VIEW dbo.contract_particular_bond_v
AS
SELECT        dbo.contract_particular_bond.contract_particular_bond_id, dbo.contract_particular_bond.contract_particular_id, dbo.contract_particular_bond.bond_id, dbo.bond.performance_bond, dbo.bond.down_payment_bond,
                          dbo.contract_particular_bond.retention_bond
FROM            dbo.contract_particular_bond LEFT OUTER JOIN
                         dbo.bond ON dbo.contract_particular_bond.bond_id = dbo.bond.bond_id
