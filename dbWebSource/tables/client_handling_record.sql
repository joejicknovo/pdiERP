CREATE TABLE client_handling_record(
client_handling_record_id	INT IDENTITY(1,1)	NOT NULL
,reference_code	NVARCHAR(100)	NOT NULL
,client_id	INT	NOT NULL
,project_id	INT	NOT NULL
,complaint_date	DATETIME	NOT NULL
,complaint_type_id	INT	NOT NULL
,complaint	VARCHAR(300)	NOT NULL
,validity_id	INT	NOT NULL
,action_taken	VARCHAR(300)	NULL
,client_feedback	VARCHAR(3000)	NULL
,date_informed	DATETIME	NOT NULL
,file_name	NVARCHAR(600)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)