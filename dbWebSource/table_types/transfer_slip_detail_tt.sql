CREATE TYPE transfer_slip_detail_tt AS TABLE(
transfer_slip_detail_id	INT	NULL
,transfer_slip_id	INT	NULL
,item_sequence	INT	NULL
,material_id	INT	NULL
,serial_no	NVARCHAR(100)	NULL
,unit_of_measure_id	INT	NULL
,quantity	DECIMAL(20)	NULL
,remarks	NVARCHAR(2000)	NULL)