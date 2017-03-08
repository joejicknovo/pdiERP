CREATE TYPE contract_documentation_tt AS TABLE(
contract_documentation_id	INT	NULL
,contract_particular_id	NCHAR(20)	NULL
,notice_of_intent	NVARCHAR(2000)	NULL
,letter_of_acceptance	NVARCHAR(2000)	NULL
,contract_agreement	NVARCHAR(2000)	NULL)