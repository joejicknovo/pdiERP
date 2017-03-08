CREATE TYPE materials_requisition_slip_tt AS TABLE(
materials_requisition_slip_id	INT	NULL
,mrs_no	NVARCHAR(100)	NULL
,doc_code	NVARCHAR(30)	NULL
,mrs_date	DATETIME	NULL
,rev_no	INT	NULL
,project_id	INT	NULL
,effectivity_date	DATETIME	NULL
,needed_date	DATETIME	NULL
,dr_no	NVARCHAR(30)	NULL
,po_no	NVARCHAR(30)	NULL
,status_id	INT	NULL
,is_active	CHAR(1)	NULL
,requested_by	INT	NULL
,requested_date	DATETIME	NULL
,noted_by	INT	NULL
,noted_date	DATETIME	NULL
,checked_by	INT	NULL
,checked_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL)