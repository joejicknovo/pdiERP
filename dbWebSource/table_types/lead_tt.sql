CREATE TYPE lead_tt AS TABLE(
lead_id	INT	NULL
,lead_no	NVARCHAR(200)	NULL
,lead_classification_id	INT	NULL
,assigned_sales_associate_id	INT	NULL
,client_id	INT	NULL
,site_location	NVARCHAR(0)	NULL
,lead_type_id	INT	NULL
,source_id	INT	NULL
,lead_source_id	INT	NULL
,visit_date	DATETIME	NULL
,remarks	NVARCHAR(0)	NULL
,status_id	INT	NULL)