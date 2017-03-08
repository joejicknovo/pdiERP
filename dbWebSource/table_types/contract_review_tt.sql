CREATE TYPE contract_review_tt AS TABLE(
contract_review_id	INT	NULL
,contract_review_no	NVARCHAR(100)	NULL
,subject	VARCHAR(300)	NULL
,project_id	INT	NULL
,contract_review_date	DATETIME	NULL)