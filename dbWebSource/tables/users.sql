CREATE TABLE users(
user_id	INT IDENTITY(1,1)	NOT NULL
,logon	NVARCHAR(40)	NULL
,last_name	NVARCHAR(200)	NOT NULL
,first_name	NVARCHAR(200)	NOT NULL
,middle_name	NVARCHAR(200)	NOT NULL
,password	NVARCHAR(400)	NULL
,role_id	INT	NULL
,plant_id	INT	NULL
,is_active	VARCHAR(1)	NULL
,is_requestor	VARCHAR(1)	NULL
,is_admin	VARCHAR(1)	NULL
,created_by	INT	NULL
,created_date	DATETIMEOFFSET	NULL
,updated_by	INT	NULL
,updated_date	DATETIMEOFFSET	NULL
,is_contact	VARCHAR(1)	NULL
,contact_nos	VARCHAR(100)	NULL
,position	NCHAR(20)	NULL
,img_filename	VARCHAR(200)	NULL
,contact_seq_no	INT	NULL
,gender	NCHAR(2)	NULL
,birth_date	DATETIME	NULL
,hired_date	DATETIME	NULL
,termination_date	DATETIME	NULL
,position_id	INT	NULL
,note	TEXT(2147483647)	NULL
,status_id	INT	NULL)