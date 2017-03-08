CREATE TYPE contract_particular_tt AS TABLE(
contract_particular_id	INT	NULL
,project_id	INT	NULL
,document_code	NVARCHAR(100)	NULL
,revision_no	INT	NULL
,effective_date	DATETIME	NULL
,status_id	INT	NULL
,prepared_by	INT	NULL
,prepared_date	DATETIME	NULL
,reviewed_by	INT	NULL
,reviewed_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL)