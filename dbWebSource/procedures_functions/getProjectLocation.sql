


CREATE FUNCTION [dbo].[getProjectLocation](
	@project_site_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_result VARCHAR(100); 

   SELECT @l_result = project_site_name + ' ' + project_site_address
   FROM dbo.project_site WHERE project_site_id = @project_site_id
   ORDER BY project_site_name ASC;

   RETURN @l_result;
END;

