CREATE TYPE document_transmittal_tt AS TABLE(
document_transmittal_id	INT	NULL
,document_transmittal_no	NVARCHAR(100)	NULL
,document_code	NVARCHAR(100)	NULL
,revision_no	INT	NULL
,effective_date	DATETIME	NULL
,address_to_id	INT	NULL
,department_id	INT	NULL
,client_id	INT	NULL
,project_id	INT	NULL)