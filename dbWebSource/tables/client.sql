CREATE TABLE client(
client_id	INT IDENTITY(1,1)	NOT NULL
,client_number	NVARCHAR(20)	NOT NULL
,customer_name	NVARCHAR(600)	NOT NULL
,address	NVARCHAR(600)	NOT NULL
,industry_id	INT	NOT NULL
,client_type_id	INT	NOT NULL
,is_active	CHAR(1)	NOT NULL
,contact_person	NVARCHAR(600)	NOT NULL
,phone_no	NVARCHAR(30)	NOT NULL
,email_address	NVARCHAR(200)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)