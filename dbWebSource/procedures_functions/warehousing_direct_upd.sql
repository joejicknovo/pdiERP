CREATE PROCEDURE [dbo].[warehousing_direct_upd]
(
    @tt    warehousing_direct_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE 
		a 
    SET  
		warehousing_id			= b.warehousing_id
		,material_id			= b.material_id
		,quantity				= b.quantity
		,warehouse_id			= b.warehouse_id
		,rack_id				= b.rack_id
		,tag_no					= b.tag_no
		,expiration_date		= b.expiration_date
        ,updated_by				= @user_id
        ,updated_date			= GETDATE()
	FROM 
		dbo.warehousing_detail a 
	INNER JOIN 
		@tt b
    ON 
		a.warehousing_detail_id = b.warehousing_detail_id 
		
-- Insert Process

    INSERT INTO 
		warehousing_detail (
        warehousing_id 
		,material_id	
		,quantity  
		,warehouse_id
		,rack_id
		,tag_no
		,expiration_date
		,created_by
        ,created_date
        )
    SELECT 
         warehousing_id = 0
		,material_id	
		,quantity  
		,warehouse_id
		,rack_id
		,tag_no
		,expiration_date
	   ,@user_id
       ,GETDATE()
    FROM 
		@tt
    WHERE 
		warehousing_detail_id IS NULL;
END

