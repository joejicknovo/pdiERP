CREATE TABLE materials_requisition_slip_detail(
materials_requisition_slip_detail_id	INT IDENTITY(1,1)	NOT NULL
,materials_requisition_slip_id	INT	NOT NULL
,item_no	INT	NOT NULL
,item_id	INT	NOT NULL
,qty	DECIMAL(20)	NOT NULL
,qty_on_stock	DECIMAL(20)	NOT NULL
,qty_issued	DECIMAL(20)	NOT NULL
,qty_to_be_purchased	DECIMAL(20)	NOT NULL
,is_active	NCHAR(2)	NULL)