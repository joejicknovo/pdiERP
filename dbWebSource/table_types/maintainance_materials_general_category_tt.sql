CREATE TYPE maintainance_materials_general_category_tt AS TABLE(
maintainance_materials_general_category_id	INT	NULL
,code	CHAR(1)	NULL
,name	NVARCHAR(600)	NULL
,parent_id	INT	NULL
,is_active	CHAR(1)	NULL)