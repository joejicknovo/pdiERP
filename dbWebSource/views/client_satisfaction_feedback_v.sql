CREATE VIEW dbo.client_satisfaction_feedback_v
AS
SELECT        client_satisfaction_feedback_id, document_no, document_date, client_id, dbo.getClientName(client_id) AS customer_name, project_id, dbo.getProjectName(project_id) AS project_name, over_all_rating, 
                         recommendation_for_improvement, prepared_by, prepared_date, reviewed_by, reviewed_date, approved_by, approved_date, updated_by, updated_date
FROM            dbo.client_satisfaction_feedback
