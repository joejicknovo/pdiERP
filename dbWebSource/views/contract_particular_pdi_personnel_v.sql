CREATE VIEW dbo.contract_particular_pdi_personnel_v
AS
SELECT        dbo.contract_particular_pdi_personnel.pdi_personnel_id, dbo.contract_particular_pdi_personnel.contract_particular_id, dbo.contract_particular_pdi_personnel.personnel_required_id, 
                         dbo.personnel_required.project_manager_id, dbo.getEmployeeFullName(dbo.personnel_required.project_manager_id) AS project_manager, dbo.contract_particular_pdi_personnel.contract_administrator_id, 
                         dbo.getEmployeeFullName(dbo.contract_particular_pdi_personnel.contract_administrator_id) AS contract_administrator, dbo.personnel_required.project_engineer_id, 
                         dbo.getEmployeeFullName(dbo.personnel_required.project_engineer_id) AS project_engineer
FROM            dbo.contract_particular_pdi_personnel LEFT OUTER JOIN
                         dbo.personnel_required ON dbo.contract_particular_pdi_personnel.personnel_required_id = dbo.personnel_required.personnel_required_id
