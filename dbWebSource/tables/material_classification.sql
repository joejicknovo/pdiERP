CREATE TABLE material_classification(
material_classification_id	INT IDENTITY(1,1)	NOT NULL
,material_classification_code	CHAR(1)	NOT NULL
,material_classification_name	NVARCHAR(600)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)