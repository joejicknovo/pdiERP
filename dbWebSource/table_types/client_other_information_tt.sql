CREATE TYPE client_other_information_tt AS TABLE(
client_id	INT	NULL
,client_other_information_id	INT	NULL
,description	NVARCHAR(2000)	NULL
,value	NVARCHAR(0)	NULL)