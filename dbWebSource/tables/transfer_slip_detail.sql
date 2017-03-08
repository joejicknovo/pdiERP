CREATE TABLE transfer_slip_detail(
transfer_slip_detail_id	INT IDENTITY(1,1)	NOT NULL
,transfer_slip_id	INT	NOT NULL
,item_sequence	INT	NOT NULL
,material_id	INT	NOT NULL
,serial_no	NVARCHAR(100)	NULL
,unit_of_measure_id	INT	NOT NULL
,quantity	DECIMAL(20)	NOT NULL
,remarks	NVARCHAR(2000)	NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,approved_by	INT	NULL
,approved_date	DATETIME	NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)