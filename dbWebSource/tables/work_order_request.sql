CREATE TABLE work_order_request(
work_order_request_id	INT IDENTITY(1,1)	NOT NULL
,document_code	NVARCHAR(100)	NULL
,revision_no	INT	NULL
,effective_date	DATETIME	NOT NULL
,work_order_request_date	DATETIME	NOT NULL
,work_order_request_to	NVARCHAR(600)	NOT NULL
,department_id	INT	NOT NULL
,project_id	INT	NOT NULL
,client_id	INT	NOT NULL
,type_of_work_id	INT	NOT NULL
,others	NVARCHAR(6000)	NULL
,description_of_work	NVARCHAR(6000)	NULL
,remarks	NVARCHAR(6000)	NULL
,status_id	INT	NOT NULL
,requested_by	INT	NULL
,requested_date	DATETIME	NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)