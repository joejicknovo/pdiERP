CREATE TYPE client_satisfaction_feedback_tt AS TABLE(
client_satisfaction_feedback_id	INT	NULL
,document_no	NVARCHAR(100)	NULL
,document_date	DATETIME	NULL
,client_id	INT	NULL
,project_id	INT	NULL
,over_all_rating	DECIMAL(20)	NULL
,recommendation_for_improvement	NVARCHAR(0)	NULL)