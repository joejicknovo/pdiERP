CREATE TYPE transfer_slip_tt AS TABLE(
transfer_slip_id	INT	NULL
,transfer_slip_no	NVARCHAR(100)	NULL
,transfer_slip_date	DATETIME	NULL
,transfer_from	INT	NULL
,transfer_to	INT	NULL
,status_id	INT	NULL
,document_code	NVARCHAR(100)	NULL
,revision_no	INT	NULL
,effective_date	DATETIME	NULL)