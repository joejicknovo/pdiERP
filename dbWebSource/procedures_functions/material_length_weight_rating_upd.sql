
CREATE PROCEDURE [dbo].[material_length_weight_rating_upd]
(
    @tt    material_length_weight_rating_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_attribute_size_capacity_id		= b.material_attribute_size_capacity_id
			,material_length_weight_rating_code			= b.material_length_weight_rating_code
			,material_length_weight_rating_name			= b.material_length_weight_rating_name
			,is_active									= b.is_active
            ,updated_by									= @user_id
            ,updated_date								= GETDATE()
        FROM dbo.material_length_weight_rating a INNER JOIN @tt b
        ON a.material_length_weight_rating_id = b.material_length_weight_rating_id 
        WHERE (
				isnull(a.material_attribute_size_capacity_id,0)			<> isnull(b.material_attribute_size_capacity_id,0) 
			OR	isnull(a.material_length_weight_rating_code,'')			<> isnull(b.material_length_weight_rating_code,'')   
			OR	isnull(a.material_length_weight_rating_name,'')			<> isnull(b.material_length_weight_rating_name,'')   
			OR	isnull(a.is_active,'')									<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_length_weight_rating (
		 material_attribute_size_capacity_id
		,material_length_weight_rating_code 
		,material_length_weight_rating_name
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_attribute_size_capacity_id
		,material_length_weight_rating_code 
		,material_length_weight_rating_name
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_length_weight_rating_id IS NULL;
END

