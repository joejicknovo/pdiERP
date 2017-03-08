CREATE TABLE material_item(
material_item_id	INT IDENTITY(1,1)	NOT NULL
,material_general_category_id	INT	NOT NULL
,material_item_code	CHAR(1)	NOT NULL
,material_item_name	NVARCHAR(600)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)