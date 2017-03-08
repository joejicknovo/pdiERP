CREATE VIEW dbo.work_order_request_v
AS
SELECT        work_order_request_id, document_code, revision_no, effective_date, work_order_request_date, work_order_request_to, department_id, dbo.getDepartmentName(department_id) AS department_name, project_id, 
                         dbo.getProjectName(project_id) AS project_name, client_id, dbo.getClientName(client_id) AS client_name, type_of_work_id, dbo.getStatusName(type_of_work_id) AS type_of_work_name, others, 
                         description_of_work, remarks, status_id, dbo.getStatusName(status_id) AS status_name, requested_by, dbo.getEmployeeFullName(requested_by) AS requested_by_name, requested_date, received_by, 
                         dbo.getEmployeeFullName(received_by) AS received_by_name, received_date, created_by, created_date, updated_by, updated_date
FROM            dbo.work_order_request
