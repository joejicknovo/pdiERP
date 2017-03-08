CREATE TABLE lead_followup_date(
lead_followup_id	INT IDENTITY(1,1)	NOT NULL
,lead_id	INT	NULL
,followup_date	DATETIME	NULL
,reminder	NTEXT(2147483646)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)