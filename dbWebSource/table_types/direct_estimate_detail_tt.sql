CREATE TYPE direct_estimate_detail_tt AS TABLE(
direct_estimate_detail_id	INT	NULL
,direct_estimate_id	INT	NULL
,item_seq_number	INT	NULL
,qty	DECIMAL(20)	NULL
,item_seq	NVARCHAR(20)	NULL
,material	DECIMAL(20)	NULL
,type_id	INT	NULL
,material_multiplier	DECIMAL(20)	NULL
,description	NVARCHAR(0)	NULL
,labor	DECIMAL(20)	NULL
,item_id	INT	NULL
,labor_multiplier	DECIMAL(20)	NULL
,is_sample_card	NCHAR(2)	NULL
,is_active	NCHAR(2)	NULL)