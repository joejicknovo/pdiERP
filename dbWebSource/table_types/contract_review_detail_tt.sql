CREATE TYPE contract_review_detail_tt AS TABLE(
contract_review_detail_id	INT	NULL
,contract_review_id	INT	NULL
,item_no	INT	NULL
,document	NVARCHAR(600)	NULL
,description	NVARCHAR(2000)	NULL
,comment	NVARCHAR(600)	NULL
,recommended_action	NVARCHAR(600)	NULL
,responsibility	NVARCHAR(600)	NULL)