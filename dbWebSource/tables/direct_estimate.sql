CREATE TABLE direct_estimate(
direct_estimate_id	INT IDENTITY(1,1)	NOT NULL
,direct_estimate_no	NVARCHAR(100)	NOT NULL
,doc_code	NVARCHAR(30)	NOT NULL
,rev_no	INT	NOT NULL
,effectivity_date	DATETIME	NOT NULL
,project_id	INT	NOT NULL
,subject	NVARCHAR(600)	NOT NULL
,status_id	INT	NOT NULL
,is_active	NCHAR(2)	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,reviewed_by	INT	NULL
,reviewed_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)