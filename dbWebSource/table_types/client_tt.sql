CREATE TYPE client_tt AS TABLE(
client_id	INT	NULL
,client_number	NVARCHAR(20)	NULL
,customer_name	NVARCHAR(600)	NULL
,address	NVARCHAR(600)	NULL
,industry_id	INT	NULL
,client_type_id	INT	NULL
,is_active	CHAR(1)	NULL
,contact_person	NVARCHAR(600)	NULL
,phone_no	NVARCHAR(30)	NULL
,email_address	NVARCHAR(200)	NULL)