CREATE TABLE warehousing_detail(
warehousing_detail_id	INT IDENTITY(1,1)	NOT NULL
,warehousing_id	INT	NOT NULL
,material_id	INT	NOT NULL
,quantity	DECIMAL(20)	NOT NULL
,warehouse_id	INT	NULL
,rack_id	INT	NULL
,tag_no	VARCHAR(50)	NULL
,expiration_date	DATETIME	NULL
,warehousing_return_id	INT	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)