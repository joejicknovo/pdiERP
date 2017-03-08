CREATE TABLE product_service_performance(
product_service_performance_id	INT IDENTITY(1,1)	NOT NULL
,seq_no	INT	NOT NULL
,parameter	NVARCHAR(6000)	NOT NULL
,performance_criteria	NTEXT(2147483646)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)