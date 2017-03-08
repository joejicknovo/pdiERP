CREATE VIEW dbo.client_satisfaction_feedback_product_performance_v
AS
SELECT        dbo.client_satisfaction_feedback_product_performance.client_satisfaction_feedback_product_performance_id, dbo.client_satisfaction_feedback_product_performance.client_satisfaction_feedback_id, 
                         dbo.client_satisfaction_feedback_product_performance.product_service_performance_id, dbo.client_satisfaction_feedback_product_performance.status_id, dbo.status.status_name, 
                         dbo.client_satisfaction_feedback_product_performance.created_by, dbo.client_satisfaction_feedback_product_performance.created_date, dbo.client_satisfaction_feedback_product_performance.updated_by, 
                         dbo.client_satisfaction_feedback_product_performance.updated_date
FROM            dbo.client_satisfaction_feedback_product_performance INNER JOIN
                         dbo.status ON dbo.client_satisfaction_feedback_product_performance.status_id = dbo.status.status_id
