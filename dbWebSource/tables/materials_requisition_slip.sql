CREATE TABLE materials_requisition_slip(
materials_requisition_slip_id	INT IDENTITY(1,1)	NOT NULL
,doc_code	NVARCHAR(30)	NOT NULL
,rev_no	INT	NOT NULL
,effectivity_date	DATETIME	NOT NULL
,mrs_no	NVARCHAR(40)	NOT NULL
,mrs_date	DATETIME	NOT NULL
,project_id	INT	NOT NULL
,needed_date	DATETIME	NOT NULL
,dr_no	NVARCHAR(60)	NOT NULL
,po_no	NVARCHAR(60)	NOT NULL
,status_id	INT	NOT NULL
,is_active	NCHAR(2)	NULL
,requested_by	INT	NOT NULL
,requested_date	DATETIME	NOT NULL
,noted_by	INT	NULL
,noted_date	DATETIME	NULL
,checked_by	INT	NULL
,checked_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)