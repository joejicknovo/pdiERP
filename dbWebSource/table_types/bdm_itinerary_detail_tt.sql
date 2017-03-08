CREATE TYPE bdm_itinerary_detail_tt AS TABLE(
bdm_itinerary_detail_id	INT	NULL
,bdm_itinerary_id	INT	NULL
,day_id	INT	NULL
,time	TIME(12)	NULL
,client_id	INT	NULL
,address	NVARCHAR(600)	NULL
,contact_person	NVARCHAR(600)	NULL)