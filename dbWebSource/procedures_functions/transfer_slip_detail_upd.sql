

CREATE PROCEDURE [dbo].[transfer_slip_detail_upd]
(
    @tt    transfer_slip_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  transfer_slip_id		= b.transfer_slip_id
		    ,item_sequence			= b.item_sequence
			,material_id			= b.material_id
			,serial_no				= b.serial_no
			,unit_of_measure_id		= b.unit_of_measure_id
			,quantity				= b.quantity
			,remarks				= b.remarks
            ,updated_by				= @user_id
            ,updated_date			= GETDATE()
		FROM dbo.transfer_slip_detail a INNER JOIN @tt b
        ON a.transfer_slip_detail_id = b.transfer_slip_detail_id 
	   
-- Insert Process
    INSERT INTO transfer_slip_detail (
		 transfer_slip_id	
		,item_sequence		
		,material_id		
		,serial_no			
		,unit_of_measure_id	
		,quantity			
		,remarks			
        ,prepared_by
        ,prepared_date
        )
    SELECT 
		 transfer_slip_id	
		,item_sequence		
		,material_id		
		,serial_no			
		,unit_of_measure_id	
		,quantity			
		,remarks			
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE transfer_slip_detail_id IS NULL;

	RETURN @@IDENTITY;
END


