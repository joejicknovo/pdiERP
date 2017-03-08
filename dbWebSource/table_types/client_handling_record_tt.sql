CREATE TYPE client_handling_record_tt AS TABLE(
client_handling_record_id	INT	NULL
,reference_code	NVARCHAR(100)	NULL
,client_id	INT	NULL
,complaint_date	DATETIME	NULL
,complaint_type_id	INT	NULL
,complaint	VARCHAR(300)	NULL
,validity_id	INT	NULL
,action_taken	VARCHAR(300)	NULL
,project_id	INT	NULL
,client_feedback	VARCHAR(3000)	NULL
,date_informed	DATETIME	NULL
,file_name	NVARCHAR(600)	NULL)