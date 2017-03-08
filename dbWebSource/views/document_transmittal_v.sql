CREATE VIEW dbo.document_transmittal_v
AS
SELECT        document_transmittal_id, document_transmittal_no, document_code, revision_no, effective_date, address_to_id, dbo.getDepartmentName(address_to_id) AS address_to, department_id, 
                         dbo.getDepartmentName(department_id) AS department_name, client_id, dbo.getClientName(client_id) AS client_name, project_id, dbo.getProjectName(project_id) AS project_name, 
                         dbo.countDocumentTransmittalDetails(document_transmittal_id) AS countDetails, prepared_by, dbo.getEmployeeFullName(prepared_by) AS prepared_name, prepared_date, received_by, 
                         dbo.getEmployeeFullName(received_by) AS received_name, received_date, updated_by, dbo.getEmployeeFullName(updated_by) AS updated_name, updated_date
FROM            dbo.document_transmittal
