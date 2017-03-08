CREATE TYPE warehouse_releasing_tt AS TABLE(
warehouse_releasing_id	INT	NULL
,warehouse_releasing_no	NVARCHAR(100)	NULL
,warehouse_releasing_date	DATETIME	NULL
,po_number	NVARCHAR(100)	NULL
,project_id	INT	NULL
,status_id	INT	NULL)