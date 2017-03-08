


CREATE PROCEDURE [dbo].[major_electrical_equipment_required_upd]
(
    @tt    major_electrical_equipment_required_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  prospective_project_evaluation_id	= b.prospective_project_evaluation_id
			,equipment							= b.equipment
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.major_electrical_equipment_required a INNER JOIN @tt b
        ON a.major_electrical_equipment_required_id = b.major_electrical_equipment_required_id 
       WHERE (
				isnull(a.prospective_project_evaluation_id,0)	<> isnull(b.prospective_project_evaluation_id,0)  
			OR	isnull(a.equipment,'')							<> isnull(b.equipment,'')
	   )
	   
-- Insert Process

    INSERT INTO major_electrical_equipment_required (
		 prospective_project_evaluation_id
	    ,equipment
		,created_by
        ,created_date
        )
    SELECT 
		prospective_project_evaluation_id
	   ,equipment	
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE major_electrical_equipment_required_id IS NULL

END



