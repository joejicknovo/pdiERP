CREATE TABLE return_material_detail(
return_material_detail_id	INT IDENTITY(1,1)	NOT NULL
,return_material_id	INT	NOT NULL
,material_id	INT	NOT NULL
,unit_of_measure_id	INT	NOT NULL
,unit_cost	DECIMAL(20)	NOT NULL
,quantity	DECIMAL(20)	NOT NULL
,amount	DECIMAL(20)	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)