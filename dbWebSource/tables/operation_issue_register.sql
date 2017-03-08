CREATE TABLE operation_issue_register(
operation_issue_register_id	INT IDENTITY(1,1)	NOT NULL
,reference_no	NVARCHAR(100)	NOT NULL
,last_review_date	DATETIME	NOT NULL
,status_id	INT	NOT NULL
,document_code	NVARCHAR(100)	NOT NULL
,revision_no	INT	NOT NULL
,effective_date	DATETIME	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)