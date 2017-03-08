CREATE TABLE prospective_project_evaluation(
prospective_project_evaluation_id	INT IDENTITY(1,1)	NOT NULL
,lead_id	INT	NOT NULL
,document_code	NVARCHAR(100)	NOT NULL
,revision_no	INT	NOT NULL
,effectivity_date	DATETIME	NOT NULL
,bdm_manager_recommendation_action	CHAR(1)	NULL
,bdm_manager_date_action	DATETIME	NULL
,vp_engineering_recommendation_action	CHAR(1)	NULL
,vp_engineering_date_action	DATETIME	NULL
,operation_manager_recommendation_action	CHAR(1)	NULL
,operation_manager_date_action	DATETIME	NULL
,president_recommendation_action	CHAR(1)	NULL
,president_date_action	DATETIME	NULL
,status_id	INT	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)