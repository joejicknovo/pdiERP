CREATE TYPE direct_estimate_tt AS TABLE(
direct_estimate_id	INT	NULL
,direct_estimate_no	NVARCHAR(100)	NULL
,doc_code	NVARCHAR(30)	NULL
,project_id	INT	NULL
,rev_no	INT	NULL
,effectivity_date	DATETIME	NULL
,subject	NVARCHAR(600)	NULL
,status_id	INT	NULL
,is_active	CHAR(1)	NULL
,prepared_by	INT	NULL
,prepared_date	DATETIME	NULL
,reviewed_by	INT	NULL
,reviewed_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL)