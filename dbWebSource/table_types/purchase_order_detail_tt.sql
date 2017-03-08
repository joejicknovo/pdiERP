CREATE TYPE purchase_order_detail_tt AS TABLE(
purchase_order_detail_id	INT	NULL
,purchase_order_id	INT	NULL
,quantity	DECIMAL(20)	NULL
,item_id	INT	NULL
,description	NVARCHAR(600)	NULL
,is_active	NCHAR(2)	NULL)