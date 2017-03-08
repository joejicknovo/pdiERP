CREATE TYPE return_material_detail_tt AS TABLE(
return_material_detail_id	INT	NULL
,return_material_id	INT	NULL
,material_id	INT	NULL
,unit_of_measure_id	INT	NULL
,unit_cost	DECIMAL(20)	NULL
,quantity	DECIMAL(20)	NULL
,amount	DECIMAL(20)	NULL)