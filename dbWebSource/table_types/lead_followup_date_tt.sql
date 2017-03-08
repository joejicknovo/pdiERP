CREATE TYPE lead_followup_date_tt AS TABLE(
lead_id	INT	NULL
,lead_followup_id	INT	NULL
,followup_date	DATETIME	NULL
,reminder	NVARCHAR(0)	NULL)