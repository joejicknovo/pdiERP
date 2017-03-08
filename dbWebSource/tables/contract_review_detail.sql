CREATE TABLE contract_review_detail(
contract_review_detail_id	INT IDENTITY(1,1)	NOT NULL
,contract_review_id	INT	NOT NULL
,item_no	INT	NOT NULL
,document	NVARCHAR(600)	NOT NULL
,description	NVARCHAR(2000)	NULL
,comment	NVARCHAR(600)	NULL
,recommended_action	NVARCHAR(600)	NOT NULL
,responsibility	NVARCHAR(600)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)