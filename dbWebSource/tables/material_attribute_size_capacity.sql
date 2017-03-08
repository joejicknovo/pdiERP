CREATE TABLE material_attribute_size_capacity(
material_attribute_size_capacity_id	INT IDENTITY(1,1)	NOT NULL
,material_type_id	INT	NOT NULL
,material_attribute_size_capacity_code	CHAR(1)	NOT NULL
,material_attribute_size_capacity_name	NVARCHAR(600)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)