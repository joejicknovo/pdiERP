CREATE TABLE contract_particular(
contract_particular_id	INT IDENTITY(1,1)	NOT NULL
,project_id	INT	NOT NULL
,document_code	NVARCHAR(100)	NOT NULL
,revision_no	INT	NOT NULL
,effective_date	DATETIME	NULL
,status_id	INT	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,reviewed_by	INT	NULL
,reviewed_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)