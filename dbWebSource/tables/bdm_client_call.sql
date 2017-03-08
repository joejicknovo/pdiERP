CREATE TABLE bdm_client_call(
bdm_client_call_id	INT IDENTITY(1,1)	NOT NULL
,bdm_client_call_no	NVARCHAR(100)	NOT NULL
,document_code	NVARCHAR(30)	NOT NULL
,revision_no	INT	NOT NULL
,effective_date	DATETIME	NOT NULL
,date_visit	DATETIME	NOT NULL
,client_id	INT	NOT NULL
,detail_visit	NTEXT(2147483646)	NOT NULL
,next_action	NVARCHAR(6000)	NULL
,remarks	NVARCHAR(6000)	NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,reviewed_by	INT	NULL
,reviewed_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)