CREATE TYPE personnel_required_tt AS TABLE(
personnel_required_id	INT	NULL
,prospective_project_evaluation_id	INT	NULL
,project_manager_id	INT	NULL
,project_engineer_id	INT	NULL
,safety_engineer_id	INT	NULL
,material_engineer_id	INT	NULL
,others	NVARCHAR(600)	NULL)