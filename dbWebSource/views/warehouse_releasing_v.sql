CREATE VIEW dbo.warehouse_releasing_v
AS
SELECT        dbo.warehouse_releasing.warehouse_releasing_id, dbo.warehouse_releasing.warehouse_releasing_no, dbo.warehouse_releasing.warehouse_releasing_date, dbo.warehouse_releasing.po_number, 
                         dbo.warehouse_releasing.project_id, dbo.project.project_name, dbo.project_site.project_site_name AS project_location, dbo.warehouse_releasing.status_id, 
                         dbo.getStatusName(dbo.warehouse_releasing.status_id) AS status_name, dbo.warehouse_releasing.prepared_by, dbo.getEmployeeFullName(dbo.warehouse_releasing.prepared_by) AS prepared_by_name, 
                         dbo.warehouse_releasing.prepared_date, dbo.warehouse_releasing.approved_by, dbo.getEmployeeFullName(dbo.warehouse_releasing.approved_by) AS approved_by_name, 
                         dbo.warehouse_releasing.approved_date, dbo.warehouse_releasing.received_by, dbo.getEmployeeFullName(dbo.warehouse_releasing.received_by) AS received_by_name, 
                         dbo.warehouse_releasing.received_date, dbo.getEmployeeFullName(dbo.warehouse_releasing.updated_by) AS updated_by_name, dbo.warehouse_releasing.updated_by, 
                         dbo.warehouse_releasing.updated_date
FROM            dbo.project_site RIGHT OUTER JOIN
                         dbo.project ON dbo.project_site.project_site_id = dbo.project.project_location_id RIGHT OUTER JOIN
                         dbo.warehouse_releasing ON dbo.project.project_id = dbo.warehouse_releasing.project_id
