

CREATE PROCEDURE [dbo].[material_color_schedule_grade_upd]
(
    @tt    material_color_schedule_grade_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_length_weight_rating_id			= b.material_length_weight_rating_id
			,material_color_schedule_grade_code			= b.material_color_schedule_grade_code
			,material_color_schedule_grade_name			= b.material_color_schedule_grade_name
			,is_active									= b.is_active
            ,updated_by									= @user_id
            ,updated_date								= GETDATE()
        FROM dbo.material_color_schedule_grade a INNER JOIN @tt b
        ON a.material_color_schedule_grade_id = b.material_color_schedule_grade_id 
        WHERE (
				isnull(a.material_length_weight_rating_id,0)			<> isnull(b.material_length_weight_rating_id,0) 
			OR	isnull(a.material_color_schedule_grade_code,'')			<> isnull(b.material_color_schedule_grade_code,'')   
			OR	isnull(a.material_color_schedule_grade_name,'')			<> isnull(b.material_color_schedule_grade_name,'')   
			OR	isnull(a.is_active,'')									<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_color_schedule_grade (
		 material_length_weight_rating_id
		,material_color_schedule_grade_code 
		,material_color_schedule_grade_name
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_length_weight_rating_id
		,material_color_schedule_grade_code 
		,material_color_schedule_grade_name
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_color_schedule_grade_id IS NULL;
END


