
create PROCEDURE [dbo].[purchase_order_detail_upd]
(
    @tt    purchase_order_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
	UPDATE 
		a 
	SET  
		purchase_order_id		= b.purchase_order_id
		,quantity				= b.quantity
		,item_id				= b.item_id
		,[description]			= b.[description]
		,is_active				= b.is_active
	FROM dbo.purchase_order_detail a INNER JOIN @tt b
    ON a.purchase_order_detail_id = b.purchase_order_detail_id 
      
-- Insert Process
	INSERT INTO purchase_order_detail (
		purchase_order_id 
		,quantity	
		,item_id  
		,[description]
		,is_active
        )
    SELECT 
        purchase_order_id 
		,quantity	
		,item_id  
		,[description]
		,is_active
    FROM @tt
    WHERE purchase_order_detail_id IS NULL;
END








