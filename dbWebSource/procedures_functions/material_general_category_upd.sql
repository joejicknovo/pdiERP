

CREATE PROCEDURE [dbo].[material_general_category_upd]
(
    @tt    material_general_category_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_classification_id			= b.material_classification_id
			,material_general_category_code		= b.material_general_category_code
			,material_general_category_name		= b.material_general_category_name
			,is_active							= b.is_active
            ,updated_by							= @user_id
            ,updated_date						= GETDATE()
        FROM dbo.material_general_category a INNER JOIN @tt b
        ON a.material_general_category_id = b.material_general_category_id 
        WHERE (
				isnull(a.material_classification_id,0)			<> isnull(b.material_classification_id,0) 
			OR	isnull(a.material_general_category_code,'')		<> isnull(b.material_general_category_code,'')   
			OR	isnull(a.material_general_category_name,'')		<> isnull(b.material_general_category_name,'')   
			OR	isnull(a.is_active,'')							<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_general_category (
		 material_classification_id
		,material_general_category_code 
		,material_general_category_name
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_classification_id
		,material_general_category_code 
		,material_general_category_name
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_general_category_id IS NULL;
END


