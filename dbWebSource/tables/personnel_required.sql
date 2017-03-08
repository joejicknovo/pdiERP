CREATE TABLE personnel_required(
personnel_required_id	INT IDENTITY(1,1)	NOT NULL
,prospective_project_evaluation_id	INT	NOT NULL
,project_manager_id	INT	NOT NULL
,project_engineer_id	INT	NOT NULL
,safety_engineer_id	INT	NOT NULL
,material_engineer_id	INT	NOT NULL
,others	NVARCHAR(600)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)