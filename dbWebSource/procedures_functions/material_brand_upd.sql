
CREATE PROCEDURE [dbo].[material_brand_upd]
(
    @tt    material_brand_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_brand_code			= b.material_brand_code
			,material_brand_name			= b.material_brand_name
			,is_active						= b.is_active
            ,updated_by						= @user_id
            ,updated_date					= GETDATE()
        FROM dbo.material_brand a INNER JOIN @tt b
        ON a.material_brand_id = b.material_brand_id 
        WHERE (
				isnull(a.material_brand_code,'')	<> isnull(b.material_brand_code,'')   
			OR	isnull(a.material_brand_name,'')	<> isnull(b.material_brand_name,'')   
			OR	isnull(a.is_active,'')				<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_brand (
		 material_brand_code 
		,material_brand_name
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_brand_code 
		,material_brand_name
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_brand_id IS NULL;
END

