CREATE TYPE bdm_itinerary_tt AS TABLE(
bdm_itinerary_id	INT	NULL
,bdm_itinerary_no	NVARCHAR(100)	NULL
,document_code	NVARCHAR(100)	NULL
,revision_no	INT	NULL
,effective_date	DATETIME	NULL
,status_id	INT	NULL)