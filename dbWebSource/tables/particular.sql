CREATE TABLE particular(
particular_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,commercial_condition_id	INT	NOT NULL
,division	NVARCHAR(600)	NOT NULL
,payment_unfixed_material_on_site	DECIMAL(20)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)