CREATE TABLE contract_particular_programme(
contract_particular_programme_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,programme_id	INT	NOT NULL
,commencement_date	DATETIME	NULL
,contractual_completion_date	DATETIME	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)