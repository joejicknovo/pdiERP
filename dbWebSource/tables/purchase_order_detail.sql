CREATE TABLE purchase_order_detail(
purchase_order_detail_id	INT IDENTITY(1,1)	NOT NULL
,purchase_order_id	INT	NOT NULL
,quantity	DECIMAL(20)	NOT NULL
,item_id	INT	NOT NULL
,description	NVARCHAR(600)	NULL
,is_active	NCHAR(2)	NULL)