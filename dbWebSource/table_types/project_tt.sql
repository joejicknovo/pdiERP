CREATE TYPE project_tt AS TABLE(
project_id	INT	NULL
,prospective_project_evaluation_id	INT	NULL
,project_no	NVARCHAR(20)	NULL
,project_name	NVARCHAR(600)	NULL
,project_location_id	INT	NULL
,client_id	INT	NULL
,form_contract	NVARCHAR(40)	NULL
,form_subcontract	NVARCHAR(40)	NULL
,system_measurement	NVARCHAR(40)	NULL
,status_id	INT	NULL)