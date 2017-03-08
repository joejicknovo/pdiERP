CREATE TYPE purchase_order_tt AS TABLE(
purchase_order_id	INT	NULL
,purchase_order_number	NVARCHAR(26)	NULL
,to_id	INT	NULL
,ship_to_id	INT	NULL
,supplier_delivery_date	DATETIME	NULL
,standard_delivery_date	DATETIME	NULL
,term_id	INT	NULL
,remarks	NVARCHAR(600)	NULL
,is_active	NCHAR(2)	NULL
,is_final	NCHAR(2)	NULL
,prepared_by	INT	NULL
,prepared_date	DATETIME	NULL
,reviewed_by	INT	NULL
,reviewed_date	DATETIME	NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL)