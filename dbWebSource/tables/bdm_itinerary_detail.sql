CREATE TABLE bdm_itinerary_detail(
bdm_itinerary_detail_id	INT IDENTITY(1,1)	NOT NULL
,bdm_itinerary_id	INT	NOT NULL
,day_id	INT	NOT NULL
,time	TIME(32)	NOT NULL
,client_id	INT	NOT NULL
,address	NVARCHAR(600)	NOT NULL
,contact_person	NVARCHAR(600)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)