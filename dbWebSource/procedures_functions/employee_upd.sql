
CREATE PROCEDURE [dbo].[employee_upd]
(
    @tt    employee_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET	 last_name				= b.last_name
			,first_name				= b.first_name
			,middle_name			= b.middle_name
			,gender					= b.gender
			,birth_date				= b.birth_date
			,hired_date				= b.hired_date
			,termination_date		= b.termination_date
			,position_id			= b.position_id
			,note					= b.note
			,status_id				= b.status_id
            ,updated_by				= @user_id
            ,updated_date			= GETDATE()
     FROM dbo.users a INNER JOIN @tt b
        ON a.[user_id] = b.[user_id]
       WHERE (   
				isnull(a.last_name,'') <> isnull(b.last_name,'')   
			OR	isnull(a.first_name,'') <> isnull(b.first_name,'')   
			OR	isnull(a.middle_name,'') <> isnull(b.middle_name,'')   
			OR	isnull(a.gender,'') <> isnull(b.gender,'')   
			OR	isnull(a.birth_date,'') <> isnull(b.birth_date,'')   
			OR	isnull(a.hired_date,'') <> isnull(b.hired_date,'')   
			OR	isnull(a.termination_date,'') <> isnull(b.termination_date,'')   
			OR	isnull(a.position_id,0) <> isnull(b.position_id,0)
			OR	isnull(a.note,'') <> isnull(b.note,'')   
			OR	isnull(a.status_id,'') <> isnull(b.status_id,'')   
	   )
	   
-- Insert Process

    INSERT INTO [users] (
		 last_name
		,first_name
		,middle_name
		,gender
		,birth_date
		,hired_date
		,termination_date
		,position_id
		,note
		,status_id
        ,created_by
        ,created_date
        )
    SELECT 
        last_name
	   ,first_name
	   ,middle_name
	   ,gender
	   ,birth_date
	   ,hired_date
	   ,termination_date
	   ,position_id
	   ,note
	   ,status_id
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE [user_id] IS NULL;
END







