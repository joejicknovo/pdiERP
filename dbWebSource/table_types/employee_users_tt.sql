CREATE TYPE employee_users_tt AS TABLE(
user_id	INT	NULL
,logon	NVARCHAR(100)	NULL
,password	NVARCHAR(0)	NULL
,role_id	INT	NULL)