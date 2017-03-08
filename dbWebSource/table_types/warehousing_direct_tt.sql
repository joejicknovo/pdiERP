CREATE TYPE warehousing_direct_tt AS TABLE(
warehousing_detail_id	INT	NULL
,warehousing_id	INT	NULL
,material_id	INT	NULL
,quantity	DECIMAL(20)	NULL
,warehouse_id	INT	NULL
,rack_id	INT	NULL
,tag_no	VARCHAR(50)	NULL
,expiration_date	DATETIME	NULL)