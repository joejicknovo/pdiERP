
CREATE PROCEDURE [dbo].[return_material_upd]
(
    @tt    return_material_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
		SET  return_material_to_id			= b.return_material_to_id
			,return_material_from_id		= b.return_material_from_id
			,project_id						= b.project_id
			,attention						= b.attention
			,status_id						= b.status_id
			,other  						= b.other
			,remarks  						= b.remarks
            ,updated_by						= @user_id
            ,updated_date					= GETDATE() 
		FROM dbo.return_material a INNER JOIN @tt b
        ON a.return_material_id = b.return_material_id 

-- Insert Process
    INSERT INTO return_material (
         reference_no
		,return_material_date
		,return_material_to_id
		,return_material_from_id
		,project_id
		,attention
		,status_id
		,other
		,remarks
        ,prepared_by
        ,prepared_date
        )
    SELECT 
         reference_no
		,return_material_date
		,return_material_to_id
		,return_material_from_id
		,project_id
		,attention
		,status_id
		,other
		,remarks
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE return_material_id IS NULL;

	RETURN @@IDENTITY;
END


