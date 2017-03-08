CREATE TYPE materials_requisition_slip_detail_tt AS TABLE(
materials_requisition_slip_detail_id	INT	NULL
,materials_requisition_slip_id	INT	NULL
,item_no	INT	NULL
,qty_on_stock	DECIMAL(20)	NULL
,item_id	INT	NULL
,qty_issued	DECIMAL(20)	NULL
,qty_to_be_purchased	DECIMAL(20)	NULL
,qty	DECIMAL(20)	NULL
,is_active	NCHAR(2)	NULL)