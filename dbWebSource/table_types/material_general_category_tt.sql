CREATE TYPE material_general_category_tt AS TABLE(
material_general_category_id	INT	NULL
,material_classification_id	INT	NULL
,material_general_category_code	CHAR(1)	NULL
,material_general_category_name	NVARCHAR(600)	NULL
,is_active	CHAR(1)	NULL)