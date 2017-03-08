CREATE TABLE transfer_slip(
transfer_slip_id	INT IDENTITY(1,1)	NOT NULL
,transfer_slip_no	NVARCHAR(100)	NOT NULL
,transfer_slip_date	DATETIME	NOT NULL
,transfer_from	INT	NOT NULL
,transfer_to	INT	NOT NULL
,status_id	INT	NOT NULL
,document_code	NVARCHAR(100)	NOT NULL
,revision_no	INT	NOT NULL
,effective_date	DATETIME	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)