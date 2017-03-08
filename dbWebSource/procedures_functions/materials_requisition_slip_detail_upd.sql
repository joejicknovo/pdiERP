
create PROCEDURE [dbo].[materials_requisition_slip_detail_upd]
(
    @tt    materials_requisition_slip_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
	-- Update Process
	UPDATE 
		a 
	SET  
		materials_requisition_slip_id		= b.materials_requisition_slip_id
		,item_no							= b.item_no
		,item_id							= b.item_id
		,qty								= b.qty
		,qty_on_stock						= b.qty_on_stock
		,qty_issued							= b.qty_issued
		,qty_to_be_purchased				= b.qty_to_be_purchased
		,is_active							= b.is_active
    FROM dbo.materials_requisition_slip_detail a INNER JOIN @tt b
	ON a.materials_requisition_slip_detail_id = b.materials_requisition_slip_detail_id
	   
	-- Insert Process
    INSERT INTO materials_requisition_slip_detail (
		materials_requisition_slip_id
        ,item_no 
		,item_id
		,qty
		,qty_on_stock
		,qty_issued
		,qty_to_be_purchased
		,is_active
        )
    SELECT 
		materials_requisition_slip_id
        ,item_no 
		,item_id
		,qty
		,qty_on_stock
		,qty_issued
		,qty_to_be_purchased
		,is_active
    FROM @tt
    WHERE materials_requisition_slip_detail_id IS NULL;

	RETURN @@IDENTITY
END

