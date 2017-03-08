CREATE TABLE bid(
bid_id	INT IDENTITY(1,1)	NOT NULL
,bid_code	NVARCHAR(40)	NOT NULL
,bid_date	DATETIME	NOT NULL
,bid_type_id	INT	NOT NULL
,project_id	INT	NOT NULL
,project_type_id	INT	NOT NULL
,direct_cost	DECIMAL(20)	NOT NULL
,extended_cost	DECIMAL(20)	NULL
,selling_cost	DECIMAL(20)	NULL
,submission_date	DATETIME	NULL
,duration	INT	NULL
,client_id	INT	NOT NULL
,prebid_datetime_conference	DATETIME	NULL
,prebid_venue_conference	NVARCHAR(600)	NULL
,site_datetime_inspection	DATETIME	NULL
,site_venue_inspection	NVARCHAR(600)	NULL
,submission_courier	NVARCHAR(600)	NULL
,submission_email	NVARCHAR(200)	NULL
,submission_hardcopy	NVARCHAR(600)	NULL
,validity_of_bid	DATETIME	NULL
,bid_document_amount	DECIMAL(20)	NULL
,remark	NTEXT(2147483646)	NULL
,status_id	INT	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)