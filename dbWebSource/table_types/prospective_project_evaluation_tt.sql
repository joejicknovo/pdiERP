CREATE TYPE prospective_project_evaluation_tt AS TABLE(
prospective_project_evaluation_id	INT	NULL
,lead_id	INT	NULL
,document_code	NVARCHAR(100)	NULL
,revision_no	INT	NULL
,effectivity_date	DATETIME	NULL
,bdm_manager_recommendation_action	CHAR(1)	NULL
,bdm_manager_date_action	DATETIME	NULL
,vp_engineering_recommendation_action	CHAR(1)	NULL
,vp_engineering_date_action	DATETIME	NULL
,operation_manager_recommendation_action	CHAR(1)	NULL
,operation_manager_date_action	DATETIME	NULL
,president_recommendation_action	CHAR(1)	NULL
,president_date_action	DATETIME	NULL
,status_id	INT	NULL)