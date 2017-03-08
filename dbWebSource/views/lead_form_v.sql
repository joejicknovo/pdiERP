CREATE VIEW dbo.lead_form_v
AS
SELECT        dbo.lead.lead_id, dbo.lead.lead_no, dbo.lead.lead_classification_id, dbo.lead.assigned_sales_associate_id, dbo.lead.client_id, dbo.lead.site_location, dbo.lead.lead_type_id, dbo.lead.source_id, 
                         dbo.lead.lead_source_id, dbo.lead.visit_date, dbo.lead.remarks, dbo.lead.status_id, dbo.lead.created_by, dbo.lead.created_date, dbo.lead.updated_by, dbo.lead.updated_date, dbo.project.project_name, 
                         dbo.client.customer_name, dbo.status.status_name
FROM            dbo.lead LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.lead.lead_id = dbo.prospective_project_evaluation.lead_id LEFT OUTER JOIN
                         dbo.project ON dbo.prospective_project_evaluation.prospective_project_evaluation_id = dbo.project.prospective_project_evaluation_id LEFT OUTER JOIN
                         dbo.client ON dbo.project.client_id = dbo.client.client_id LEFT OUTER JOIN
                         dbo.status ON dbo.lead.status_id = dbo.status.status_id
