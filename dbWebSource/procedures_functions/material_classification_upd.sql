


CREATE PROCEDURE [dbo].[material_classification_upd]
(
    @tt    material_classification_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  material_classification_code		= b.material_classification_code
			,material_classification_name		= b.material_classification_name
			,is_active							= b.is_active
            ,updated_by							= @user_id
            ,updated_date						= GETDATE()
        FROM dbo.material_classification a INNER JOIN @tt b
        ON a.material_classification_id = b.material_classification_id 
        WHERE (
				isnull(a.material_classification_code,'')  <> isnull(b.material_classification_code,'')   
			OR	isnull(a.material_classification_name,'')  <> isnull(b.material_classification_name,'')   
			OR	isnull(a.is_active,'')			           <> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO dbo.material_classification (
		 material_classification_code
		,material_classification_name 
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		 material_classification_code
		,material_classification_name 
	    ,is_active
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE material_classification_id IS NULL;
END

