
CREATE FUNCTION [dbo].[getEmployeeFullName](
	@user_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_employee_name VARCHAR(100); 

   SELECT @l_employee_name = employee_fullname 
   FROM dbo.employee_fullname_v 
   WHERE [user_id] = @user_id
   AND status_id=15;

   RETURN @l_employee_name;
END;
