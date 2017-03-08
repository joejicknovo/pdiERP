CREATE TABLE contract_particular_pdi_personnel(
pdi_personnel_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,personnel_required_id	INT	NOT NULL
,contract_administrator_id	INT	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)