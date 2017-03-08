CREATE TYPE contract_particular_project_tt AS TABLE(
contract_particular_project_id	INT	NULL
,contract_particular_id	INT	NULL
,project_id	INT	NULL
,pdi_project_no	NVARCHAR(100)	NULL
,project_description	NVARCHAR(2000)	NULL
,main_contractor_id	INT	NULL
,engineer_id	INT	NULL
,pdi_role_on_project_id	INT	NULL)