CREATE TYPE return_material_tt AS TABLE(
return_material_id	INT	NULL
,reference_no	NVARCHAR(40)	NULL
,return_material_date	DATETIME	NULL
,return_material_to_id	INT	NULL
,return_material_from_id	INT	NULL
,project_id	INT	NULL
,attention	VARCHAR(300)	NULL
,status_id	INT	NULL
,other	VARCHAR(300)	NULL
,remarks	VARCHAR(2000)	NULL)