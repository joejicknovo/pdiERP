CREATE TABLE operation_issue_register_detail(
operation_issue_register_detail_id	INT IDENTITY(1,1)	NOT NULL
,operation_issue_register_id	INT	NOT NULL
,item_sequence	INT	NOT NULL
,project_id	INT	NOT NULL
,reference_war_correspondence	NVARCHAR(4000)	NOT NULL
,related_internal_external_issue	NVARCHAR(6000)	NULL
,action	NVARCHAR(6000)	NOT NULL
,related_document	NVARCHAR(2000)	NULL
,responsibility	NVARCHAR(1000)	NOT NULL
,planned_date	DATETIME	NULL
,actual_completion_date	DATETIME	NULL
,status_id	INT	NOT NULL
,date_closed	DATETIME	NULL
,remarks	NVARCHAR(6000)	NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)