CREATE TABLE material_type(
material_type_id	INT IDENTITY(1,1)	NOT NULL
,material_item_id	INT	NOT NULL
,material_type_code	CHAR(1)	NOT NULL
,material_type_name	NVARCHAR(600)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)