CREATE VIEW dbo.contract_particular_v
AS
SELECT        contract_particular_id, project_id, dbo.getProjectName(project_id) AS project_name, document_code, revision_no, effective_date, status_id, dbo.getStatusName(status_id) AS status_name, prepared_by, 
                         dbo.getEmployeeFullName(prepared_by) AS prepared_by_fullname, reviewed_by, dbo.getEmployeeFullName(reviewed_by) AS reviewed_by_fullname, approved_by, dbo.getEmployeeFullName(approved_by) 
                         AS approved_by_fullname
FROM            dbo.contract_particular
