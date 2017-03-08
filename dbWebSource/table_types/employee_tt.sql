CREATE TYPE employee_tt AS TABLE(
user_id	INT	NULL
,last_name	NVARCHAR(100)	NULL
,first_name	NVARCHAR(100)	NULL
,middle_name	NVARCHAR(100)	NULL
,gender	CHAR(1)	NULL
,birth_date	DATETIME	NULL
,hired_date	DATETIME	NULL
,termination_date	DATETIME	NULL
,position_id	INT	NULL
,note	VARCHAR(0)	NULL
,status_id	INT	NULL)