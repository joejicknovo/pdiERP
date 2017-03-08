CREATE TABLE client_satisfaction_feedback_product_performance(
client_satisfaction_feedback_product_performance_id	INT IDENTITY(1,1)	NOT NULL
,client_satisfaction_feedback_id	INT	NULL
,product_service_performance_id	INT	NULL
,status_id	INT	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)