CREATE TABLE material_brand(
material_brand_id	INT IDENTITY(1,1)	NOT NULL
,material_brand_code	NVARCHAR(20)	NOT NULL
,material_brand_name	NVARCHAR(600)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)