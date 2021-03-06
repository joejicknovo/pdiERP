CREATE TYPE work_order_request_tt AS TABLE(
work_order_request_id	INT	NULL
,work_order_request_date	DATETIME	NULL
,document_code	NVARCHAR(100)	NULL
,work_order_request_to	NVARCHAR(600)	NULL
,revision_no	INT	NULL
,department_id	INT	NULL
,effective_date	DATETIME	NULL
,project_id	INT	NULL
,description_of_work	NVARCHAR(6000)	NULL
,client_id	INT	NULL
,remarks	NVARCHAR(6000)	NULL
,type_of_work_id	INT	NULL
,status_id	INT	NULL
,others	NVARCHAR(6000)	NULL
,requested_by	INT	NULL
,requested_date	DATETIME	NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL)