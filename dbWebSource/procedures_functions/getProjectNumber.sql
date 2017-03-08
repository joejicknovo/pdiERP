

create FUNCTION [dbo].[getProjectNumber](
	@project_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_project_number VARCHAR(100); 

   SELECT @l_project_number = project_no
   FROM dbo.project WHERE project_id = @project_id

   RETURN @l_project_number;
END;
