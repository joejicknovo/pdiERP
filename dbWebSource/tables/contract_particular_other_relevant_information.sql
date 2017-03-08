CREATE TABLE contract_particular_other_relevant_information(
contract_particular_other_relevant_information_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,description	NVARCHAR(600)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)