
CREATE PROCEDURE [dbo].[material_item_upd]
(
    @tt    material_item_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_general_category_id		= b.material_general_category_id
			,material_item_code					= b.material_item_code
			,material_item_name					= b.material_item_name
			,is_active							= b.is_active
            ,updated_by							= @user_id
            ,updated_date						= GETDATE()
        FROM dbo.material_item a INNER JOIN @tt b
        ON a.material_item_id = b.material_item_id 
        WHERE (
				isnull(a.material_general_category_id,0)		<> isnull(b.material_general_category_id,0) 
			OR	isnull(a.material_item_code,'')					<> isnull(b.material_item_code,'')   
			OR	isnull(a.material_item_name,'')					<> isnull(b.material_item_name,'')   
			OR	isnull(a.is_active,'')							<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_item (
		 material_general_category_id
		,material_item_code 
		,material_item_name
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_general_category_id
		,material_item_code 
		,material_item_name
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_item_id IS NULL;
END

