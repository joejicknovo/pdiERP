CREATE VIEW dbo.operation_issue_register_v
AS
SELECT        operation_issue_register_id, reference_no, last_review_date, status_id, dbo.getStatusName(status_id) AS status_name, document_code, revision_no, effective_date, prepared_by, 
                         dbo.getEmployeeFullName(prepared_by) AS prepared_by_name, prepared_date, approved_by, dbo.getEmployeeFullName(approved_by) AS approved_by_name, approved_date, updated_by, 
                         dbo.getEmployeeFullName(updated_by) AS modified_by_name, updated_date AS modified_date, dbo.countOperationIssueRegisterDetails(operation_issue_register_id) AS countDetails
FROM            dbo.operation_issue_register
