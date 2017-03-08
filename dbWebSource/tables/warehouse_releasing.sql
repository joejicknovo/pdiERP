CREATE TABLE warehouse_releasing(
warehouse_releasing_id	INT IDENTITY(1,1)	NOT NULL
,warehouse_releasing_no	NVARCHAR(100)	NOT NULL
,warehouse_releasing_date	DATETIME	NOT NULL
,po_number	NVARCHAR(100)	NOT NULL
,project_id	INT	NOT NULL
,status_id	INT	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)