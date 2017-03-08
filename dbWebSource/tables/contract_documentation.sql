CREATE TABLE contract_documentation(
contract_documentation_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	NCHAR(20)	NOT NULL
,notice_of_intent	NVARCHAR(2000)	NULL
,letter_of_acceptance	NVARCHAR(2000)	NULL
,contract_agreement	NVARCHAR(2000)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)