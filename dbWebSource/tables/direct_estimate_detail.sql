CREATE TABLE direct_estimate_detail(
direct_estimate_detail_id	INT IDENTITY(1,1)	NOT NULL
,direct_estimate_id	INT	NOT NULL
,item_seq_number	INT	NOT NULL
,item_seq	NVARCHAR(100)	NOT NULL
,type_id	INT	NOT NULL
,description	NTEXT(2147483646)	NULL
,item_id	INT	NULL
,is_sample_card	NCHAR(2)	NOT NULL
,qty	DECIMAL(20)	NULL
,material	DECIMAL(20)	NULL
,material_multiplier	DECIMAL(20)	NULL
,labor	DECIMAL(20)	NULL
,labor_multiplier	DECIMAL(20)	NULL
,is_active	NCHAR(2)	NOT NULL)