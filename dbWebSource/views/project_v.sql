CREATE VIEW dbo.project_v
AS
SELECT        TOP (100) PERCENT dbo.project.project_id, dbo.project.prospective_project_evaluation_id, dbo.project.project_no, dbo.project.project_name, dbo.project.project_location_id, dbo.project_site.project_site_name, 
                         dbo.project.client_id, dbo.getClientName(dbo.project.client_id) AS client_name, dbo.project.form_contract, dbo.project.form_subcontract, dbo.project.system_measurement, dbo.project.status_id, 
                         dbo.getStatusName(dbo.project.status_id) AS status_name
FROM            dbo.project LEFT OUTER JOIN
                         dbo.project_site ON dbo.project.project_location_id = dbo.project_site.project_site_id
