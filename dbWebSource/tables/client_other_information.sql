CREATE TABLE client_other_information(
client_other_information_id	INT IDENTITY(1,1)	NOT NULL
,client_id	INT	NULL
,description	NVARCHAR(2000)	NULL
,value	NTEXT(2147483646)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)