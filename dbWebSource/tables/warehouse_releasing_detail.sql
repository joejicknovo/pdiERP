CREATE TABLE warehouse_releasing_detail(
warehouse_releasing_detail_id	INT IDENTITY(1,1)	NOT NULL
,warehouse_releasing_id	INT	NOT NULL
,material_id	INT	NOT NULL
,unit_of_measure_id	INT	NOT NULL
,unit_cost	DECIMAL(20)	NOT NULL
,quantity	DECIMAL(20)	NOT NULL
,amount	DECIMAL(20)	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)