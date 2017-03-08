CREATE TABLE return_material(
return_material_id	INT IDENTITY(1,1)	NOT NULL
,reference_no	NVARCHAR(40)	NOT NULL
,return_material_date	DATETIME	NOT NULL
,return_material_to_id	INT	NOT NULL
,return_material_from_id	INT	NOT NULL
,project_id	INT	NOT NULL
,attention	VARCHAR(300)	NULL
,status_id	INT	NOT NULL
,other	VARCHAR(300)	NULL
,remarks	VARCHAR(2000)	NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)