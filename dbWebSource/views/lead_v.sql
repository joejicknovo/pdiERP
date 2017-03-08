CREATE VIEW dbo.lead_v
AS
SELECT        lead_id, lead_no, lead_classification_id, dbo.getStatusName(lead_classification_id) AS lead_classification_name, assigned_sales_associate_id, dbo.getSalesAssociateName(assigned_sales_associate_id) 
                         AS assigned_sales_associate_name, dbo.getLeadProjectName(lead_id) AS project_name, client_id, dbo.getClientNumber(client_id) AS client_number, dbo.getClientName(client_id) AS customer_name, 
                         site_location, lead_type_id, dbo.getStatusName(lead_type_id) AS lead_type_name, source_id, dbo.getStatusName(source_id) AS source_name, lead_source_id, dbo.getStatusName(lead_source_id) 
                         AS lead_source_name, visit_date, remarks, status_id, dbo.getStatusName(status_id) AS status_name, created_by, created_date, updated_by, updated_date
FROM            dbo.lead
