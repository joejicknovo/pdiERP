CREATE TYPE operation_issue_register_tt AS TABLE(
operation_issue_register_id	INT	NULL
,reference_no	NVARCHAR(100)	NULL
,last_review_date	DATETIME	NULL
,status_id	INT	NULL
,document_code	NVARCHAR(100)	NULL
,revision_no	INT	NULL
,effective_date	DATETIME	NULL)