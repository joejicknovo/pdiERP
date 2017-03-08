CREATE TABLE contract_review(
contract_review_id	INT IDENTITY(1,1)	NOT NULL
,contract_review_no	NVARCHAR(100)	NOT NULL
,project_id	INT	NOT NULL
,subject	VARCHAR(300)	NOT NULL
,contract_review_date	DATETIME	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)