
CREATE PROCEDURE [dbo].[material_attribute_size_capacity_upd]
(
    @tt    material_attribute_size_capacity_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_type_id							= b.material_type_id
			,material_attribute_size_capacity_code		= b.material_attribute_size_capacity_code
			,material_attribute_size_capacity_name		= b.material_attribute_size_capacity_name
			,is_active									= b.is_active
            ,updated_by									= @user_id
            ,updated_date								= GETDATE()
        FROM dbo.material_attribute_size_capacity a INNER JOIN @tt b
        ON a.material_attribute_size_capacity_id = b.material_attribute_size_capacity_id 
        WHERE (
				isnull(a.material_type_id,0)							<> isnull(b.material_type_id,0) 
			OR	isnull(a.material_attribute_size_capacity_code,'')		<> isnull(b.material_attribute_size_capacity_code,'')   
			OR	isnull(a.material_attribute_size_capacity_name,'')		<> isnull(b.material_attribute_size_capacity_name,'')   
			OR	isnull(a.is_active,'')									<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_attribute_size_capacity (
		 material_type_id
		,material_attribute_size_capacity_code 
		,material_attribute_size_capacity_name
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_type_id
		,material_attribute_size_capacity_code 
		,material_attribute_size_capacity_name
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_attribute_size_capacity_id IS NULL;
END

