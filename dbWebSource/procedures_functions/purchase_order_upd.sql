
create PROCEDURE [dbo].[purchase_order_upd]
(
    @tt    purchase_order_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
	UPDATE 
		a 
    SET  
		purchase_order_number		= b.purchase_order_number
		,to_id						= b.to_id
		,ship_to_id					= b.ship_to_id
		,supplier_delivery_date		= b.supplier_delivery_date
		,standard_delivery_date		= b.standard_delivery_date
		,term_id					= b.term_id
		,remarks					= b.remarks
		,is_active					= b.is_active
		,is_final					= b.is_final
        ,updated_by					= @user_id
        ,updated_date				= GETDATE()
	FROM dbo.purchase_order a INNER JOIN @tt b
    ON a.purchase_order_id = b.purchase_order_id 
	   
-- Insert Process

	INSERT INTO purchase_order (
		purchase_order_number	
		,to_id					
		,ship_to_id				
		,supplier_delivery_date	
		,standard_delivery_date	
		,term_id				
		,remarks				
		,is_active				
		,is_final				
        ,created_by
        ,created_date
        )
    SELECT 
		purchase_order_number	
		,to_id					
		,ship_to_id				
		,supplier_delivery_date	
		,standard_delivery_date	
		,term_id				
		,remarks				
		,is_active				
		,is_final				
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE purchase_order_id IS NULL;
END






