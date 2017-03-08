


CREATE FUNCTION [dbo].[getDepartmentName](
	@department_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_department_name VARCHAR(100); 
   SELECT @l_department_name = department_name FROM dbo.department WHERE department_id = @department_id
   RETURN @l_department_name;
END;
