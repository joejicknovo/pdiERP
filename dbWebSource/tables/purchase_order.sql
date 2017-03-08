CREATE TABLE purchase_order(
purchase_order_id	INT IDENTITY(1,1)	NOT NULL
,purchase_order_number	NVARCHAR(26)	NOT NULL
,issued_date	DATETIME	NOT NULL
,to_id	INT	NOT NULL
,ship_to_id	INT	NOT NULL
,supplier_delivery_date	DATETIME	NOT NULL
,standard_delivery_date	DATETIME	NOT NULL
,term_id	INT	NOT NULL
,remarks	NVARCHAR(600)	NULL
,is_active	NCHAR(2)	NULL
,is_final	NCHAR(2)	NULL
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