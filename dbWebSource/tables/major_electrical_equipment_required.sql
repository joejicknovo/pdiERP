CREATE TABLE major_electrical_equipment_required(
major_electrical_equipment_required_id	INT IDENTITY(1,1)	NOT NULL
,prospective_project_evaluation_id	INT	NOT NULL
,equipment	NVARCHAR(600)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)