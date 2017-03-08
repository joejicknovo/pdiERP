CREATE VIEW dbo.operation_issue_register_detail_v
AS
SELECT        operation_issue_register_detail_id, operation_issue_register_id, item_sequence, project_id, dbo.getProjectName(project_id) AS project_name, reference_war_correspondence, related_internal_external_issue, 
                         action, related_document, responsibility, planned_date, actual_completion_date, status_id, dbo.getStatusName(status_id) AS status_name, date_closed, remarks, prepared_by, prepared_date, approved_by, 
                         approved_date, updated_by, updated_date
FROM            dbo.operation_issue_register_detail
