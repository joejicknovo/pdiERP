CREATE TYPE material_item_tt AS TABLE(
material_item_id	INT	NULL
,material_general_category_id	INT	NULL
,material_item_code	CHAR(1)	NULL
,material_item_name	NVARCHAR(600)	NULL
,is_active	CHAR(1)	NULL)