CREATE TABLE sample_card(
sample_card_id	INT IDENTITY(1,1)	NOT NULL
,scope_of_work_id	INT	NOT NULL
,engineering_sheet_number	NVARCHAR(100)	NOT NULL
,item_id	INT	NOT NULL
,specification	NVARCHAR(600)	NOT NULL
,brand_id	INT	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)