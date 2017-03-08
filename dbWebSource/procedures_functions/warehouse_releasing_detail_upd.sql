

create PROCEDURE [dbo].[warehouse_releasing_detail_upd]
(
    @tt    warehouse_releasing_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_id			= b.material_id
			,unit_of_measure_id		= b.unit_of_measure_id
			,unit_cost				= b.unit_cost
			,quantity				= b.quantity
			,amount					= (SELECT b.unit_cost * b.quantity)
            ,updated_by				= @user_id
            ,updated_date			= GETDATE()
		FROM dbo.warehouse_releasing_detail a INNER JOIN @tt b
        ON a.warehouse_releasing_detail_id = b.warehouse_releasing_detail_id 
	   
-- Insert Process
    INSERT INTO warehouse_releasing_detail (
         warehouse_releasing_id
		,material_id
		,unit_of_measure_id
		,unit_cost
		,quantity
		,amount
        ,prepared_by
        ,prepared_date
        )
    SELECT 
        warehouse_releasing_id
	   ,material_id
	   ,unit_of_measure_id
	   ,unit_cost
	   ,quantity
	   ,(SELECT unit_cost * quantity)
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE warehouse_releasing_detail_id IS NULL;

	RETURN @@IDENTITY;
END




