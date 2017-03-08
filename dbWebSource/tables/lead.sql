CREATE TABLE lead(
lead_id	INT IDENTITY(1,1)	NOT NULL
,lead_no	NVARCHAR(200)	NOT NULL
,lead_classification_id	INT	NULL
,assigned_sales_associate_id	INT	NOT NULL
,client_id	INT	NOT NULL
,site_location	NTEXT(2147483646)	NOT NULL
,lead_type_id	INT	NULL
,source_id	INT	NULL
,lead_source_id	INT	NULL
,visit_date	DATETIME	NULL
,remarks	NTEXT(2147483646)	NULL
,status_id	INT	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)