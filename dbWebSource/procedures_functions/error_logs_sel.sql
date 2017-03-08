CREATE PROCEDURE [dbo].[error_logs_sel]
(
    @error_id  INT = null
   ,@all	   INT = NULL
   ,@user_id INT=NULL
)
AS
BEGIN
	IF(NOT @user_id IS NULL) 
	BEGIN
		SELECT *,@user_id as created_by_name,@user_id as updated_by_name 
		FROM error_logs 
		where created_by =@user_id  or updated_by = @user_id 
		order by error_type, updated_date, created_date
		RETURN
	END

	IF @error_id IS NULL  AND @all IS NULL 
		SELECT *,@user_id as created_by_name,@user_id as updated_by_name 
		FROM error_logs 
		where created_by = @user_id or updated_by = @user_id 
		order by error_type, updated_date, created_date
	ELSE
		BEGIN
			IF NOT @all IS NULL 
				 SELECT *,@user_id as created_by_name,@user_id as updated_by_name 
				 FROM error_logs 
				 order by error_type, updated_date, created_date
			ELSE

			  SELECT *,@user_id as created_by_name,@user_id as updated_by_name FROM error_logs
			   WHERE error_id = @error_id;
		END 
END

 

