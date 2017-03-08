CREATE TABLE client_satisfaction_feedback(
client_satisfaction_feedback_id	INT IDENTITY(1,1)	NOT NULL
,document_no	NVARCHAR(100)	NOT NULL
,document_date	DATETIME	NOT NULL
,client_id	INT	NOT NULL
,project_id	INT	NOT NULL
,over_all_rating	DECIMAL(20)	NULL
,recommendation_for_improvement	NTEXT(2147483646)	NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,reviewed_by	INT	NULL
,reviewed_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)