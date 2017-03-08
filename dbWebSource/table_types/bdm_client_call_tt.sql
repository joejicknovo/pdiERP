CREATE TYPE bdm_client_call_tt AS TABLE(
bdm_client_call_id	INT	NULL
,bdm_client_call_no	NVARCHAR(100)	NULL
,document_code	NVARCHAR(30)	NULL
,revision_no	INT	NULL
,effective_date	DATETIME	NULL
,date_visit	DATETIME	NULL
,client_id	INT	NULL
,detail_visit	NVARCHAR(0)	NULL
,next_action	NVARCHAR(6000)	NULL
,remarks	NVARCHAR(6000)	NULL)