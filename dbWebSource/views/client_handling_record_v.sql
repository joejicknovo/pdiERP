CREATE VIEW dbo.client_handling_record_v
AS
SELECT        client_handling_record_id, reference_code, client_id, dbo.getClientNumber(client_id) AS client_number, dbo.getClientName(client_id) AS client_name, project_id, dbo.getProjectNumber(project_id) 
                         AS project_number, dbo.getProjectName(project_id) AS project_name, complaint_date, complaint_type_id, dbo.getStatusName(complaint_type_id) AS complaint_type_name, complaint, validity_id, 
                         dbo.getStatusName(validity_id) AS validity_name, action_taken, client_feedback, date_informed, file_name
FROM            dbo.client_handling_record
