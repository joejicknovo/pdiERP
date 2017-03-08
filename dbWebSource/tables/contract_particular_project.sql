CREATE TABLE contract_particular_project(
contract_particular_project_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,project_id	INT	NOT NULL
,pdi_project_no	NVARCHAR(100)	NOT NULL
,project_description	NVARCHAR(2000)	NULL
,main_contractor_id	INT	NOT NULL
,engineer_id	INT	NOT NULL
,pdi_role_on_project_id	INT	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)