CREATE TABLE document_transmittal(
document_transmittal_id	INT IDENTITY(1,1)	NOT NULL
,document_transmittal_no	NVARCHAR(100)	NOT NULL
,document_code	NVARCHAR(100)	NOT NULL
,revision_no	INT	NOT NULL
,effective_date	DATETIME	NOT NULL
,address_to_id	INT	NOT NULL
,department_id	INT	NOT NULL
,client_id	INT	NOT NULL
,project_id	INT	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)