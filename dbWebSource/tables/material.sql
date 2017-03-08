CREATE TABLE material(
material_id	INT IDENTITY(1,1)	NOT NULL
,material_code	VARCHAR(11)	NULL
,material_classification_id	INT	NOT NULL
,material_general_category_id	INT	NOT NULL
,material_item_id	INT	NOT NULL
,material_type_id	INT	NOT NULL
,material_attribute_size_capacity_id	INT	NOT NULL
,material_length_weight_rating_id	INT	NOT NULL
,material_color_schedule_grade_id	INT	NOT NULL
,additional_specification	VARCHAR(300)	NULL
,material_brand_id	INT	NULL
,unit_of_measure_id	INT	NULL
,image_filename	VARCHAR(15)	NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)