CREATE TYPE material_tt AS TABLE(
material_id	INT	NULL
,material_code	VARCHAR(11)	NULL
,material_classification_id	INT	NULL
,material_general_category_id	INT	NULL
,material_item_id	INT	NULL
,material_type_id	INT	NULL
,material_attribute_size_capacity_id	INT	NULL
,material_length_weight_rating_id	INT	NULL
,material_color_schedule_grade_id	INT	NULL
,additional_specification	VARCHAR(300)	NULL
,material_brand_id	INT	NULL
,unit_of_measure_id	INT	NULL
,image_filename	VARCHAR(15)	NULL
,is_active	CHAR(1)	NULL)