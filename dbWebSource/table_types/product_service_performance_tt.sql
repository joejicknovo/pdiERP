CREATE TYPE product_service_performance_tt AS TABLE(
product_service_performance_id	INT	NULL
,seq_no	INT	NULL
,parameter	NVARCHAR(6000)	NULL
,performance_criteria	NVARCHAR(0)	NULL
,is_active	CHAR(1)	NULL)