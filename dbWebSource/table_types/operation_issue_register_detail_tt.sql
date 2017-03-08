CREATE TYPE operation_issue_register_detail_tt AS TABLE(
operation_issue_register_detail_id	INT	NULL
,operation_issue_register_id	INT	NULL
,item_sequence	INT	NULL
,project_id	INT	NULL
,reference_war_correspondence	NVARCHAR(4000)	NULL
,related_internal_external_issue	NVARCHAR(6000)	NULL
,action	NVARCHAR(6000)	NULL
,related_document	NVARCHAR(2000)	NULL
,responsibility	NVARCHAR(1000)	NULL
,planned_date	DATETIME	NULL
,actual_completion_date	DATETIME	NULL
,status_id	INT	NULL
,date_closed	DATETIME	NULL
,remarks	NVARCHAR(6000)	NULL)