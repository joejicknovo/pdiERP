
CREATE PROCEDURE [dbo].[material_type_upd]
(
    @tt    material_type_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_item_id		= b.material_item_id
			,material_type_code		= b.material_type_code
			,material_type_name		= b.material_type_name
			,is_active				= b.is_active
            ,updated_by				= @user_id
            ,updated_date			= GETDATE()
        FROM dbo.material_type a INNER JOIN @tt b
        ON a.material_type_id = b.material_type_id 
        WHERE (
				isnull(a.material_item_id,0)		<> isnull(b.material_item_id,0) 
			OR	isnull(a.material_type_code,'')		<> isnull(b.material_type_code,'')   
			OR	isnull(a.material_type_name,'')		<> isnull(b.material_type_name,'')   
			OR	isnull(a.is_active,'')				<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_type (
		 material_item_id
		,material_type_code 
		,material_type_name
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_item_id
		,material_type_code 
		,material_type_name
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_type_id IS NULL;
END

