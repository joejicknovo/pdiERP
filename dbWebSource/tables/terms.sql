CREATE TABLE terms(
term_id	INT IDENTITY(1,1)	NOT NULL
,term	NVARCHAR(100)	NOT NULL
,is_active	NCHAR(2)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)