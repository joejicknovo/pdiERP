CREATE VIEW dbo.contract_particular_project_v
AS
SELECT        dbo.contract_particular_project.contract_particular_project_id, dbo.contract_particular_project.contract_particular_id, dbo.contract_particular_project.project_id, 
                         dbo.getProjectName(dbo.contract_particular_project.project_id) AS project_name, dbo.project.project_no, dbo.project.project_name AS Expr1, dbo.project.project_location_id, dbo.project_site.project_site_name, 
                         dbo.contract_particular_project.pdi_project_no, dbo.contract_particular_project.project_description, dbo.project.client_id, dbo.getClientName(dbo.project.client_id) AS client_name, dbo.project.form_contract, 
                         dbo.project.form_subcontract, dbo.project.system_measurement, dbo.contract_particular_project.main_contractor_id, dbo.getStatusName(dbo.contract_particular_project.main_contractor_id) 
                         AS main_contractor_name, dbo.contract_particular_project.engineer_id, dbo.getEmployeeFullName(dbo.contract_particular_project.engineer_id) AS engineer_fullname, 
                         dbo.contract_particular_project.pdi_role_on_project_id, dbo.getStatusName(dbo.contract_particular_project.pdi_role_on_project_id) AS pdi_project_role
FROM            dbo.project_site RIGHT OUTER JOIN
                         dbo.project ON dbo.project_site.project_site_id = dbo.project.project_location_id RIGHT OUTER JOIN
                         dbo.contract_particular_project ON dbo.project.project_id = dbo.contract_particular_project.project_id
