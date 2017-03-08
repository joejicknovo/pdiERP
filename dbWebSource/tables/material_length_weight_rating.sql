CREATE TABLE material_length_weight_rating(
material_length_weight_rating_id	INT IDENTITY(1,1)	NOT NULL
,material_attribute_size_capacity_id	INT	NOT NULL
,material_length_weight_rating_code	CHAR(1)	NOT NULL
,material_length_weight_rating_name	NVARCHAR(600)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)