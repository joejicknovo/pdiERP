CREATE TYPE warehouse_releasing_detail_tt AS TABLE(
warehouse_releasing_detail_id	INT	NULL
,warehouse_releasing_id	INT	NULL
,material_id	INT	NULL
,unit_of_measure_id	INT	NULL
,unit_cost	DECIMAL(20)	NULL
,quantity	DECIMAL(20)	NULL)