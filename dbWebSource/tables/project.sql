CREATE TABLE project(
project_id	INT IDENTITY(1,1)	NOT NULL
,prospective_project_evaluation_id	INT	NOT NULL
,project_no	NVARCHAR(100)	NOT NULL
,project_name	NVARCHAR(600)	NOT NULL
,project_location_id	INT	NOT NULL
,client_id	INT	NOT NULL
,form_contract	NVARCHAR(40)	NOT NULL
,form_subcontract	NVARCHAR(40)	NOT NULL
,system_measurement	NVARCHAR(40)	NOT NULL
,status_id	INT	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)