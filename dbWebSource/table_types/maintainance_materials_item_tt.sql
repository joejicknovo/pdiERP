CREATE TYPE maintainance_materials_item_tt AS TABLE(
maintainance_materials_item_id	INT	NULL
,code	CHAR(1)	NULL
,name	NVARCHAR(600)	NULL
,parent_id	INT	NULL
,is_active	CHAR(1)	NULL)