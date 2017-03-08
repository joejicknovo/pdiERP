CREATE TYPE direct_estimate_sample_card_tt AS TABLE(
sample_card_id	INT	NULL
,scope_of_work_id	INT	NULL
,engineering_sheet_number	NVARCHAR(100)	NULL
,item_id	INT	NULL
,specification	NVARCHAR(600)	NULL
,brand_id	INT	NULL)