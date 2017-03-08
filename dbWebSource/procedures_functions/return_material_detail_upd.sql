
CREATE PROCEDURE [dbo].[return_material_detail_upd]
(
    @tt    return_material_detail_tt READONLY
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
		FROM dbo.return_material_detail a INNER JOIN @tt b
        ON a.return_material_detail_id = b.return_material_detail_id 
	   
-- Insert Process
    INSERT INTO return_material_detail (
         return_material_id
		,material_id
		,unit_of_measure_id
		,unit_cost
		,quantity
		,amount
        ,prepared_by
        ,prepared_date
        )
    SELECT 
         return_material_id
		,material_id
		,unit_of_measure_id
		,unit_cost
		,quantity
	    ,(SELECT unit_cost * quantity)
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE return_material_detail_id IS NULL;

	RETURN @@IDENTITY;
END

