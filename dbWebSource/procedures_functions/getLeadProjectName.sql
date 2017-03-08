
CREATE FUNCTION [dbo].[getLeadProjectName](
	@lead_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_project_name VARCHAR(100); 

   SELECT @l_project_name = c.project_name 
   FROM dbo.lead AS a
   LEFT OUTER JOIN dbo.prospective_project_evaluation AS b ON  a.lead_id = b.lead_id
   LEFT OUTER JOIN dbo.project AS c ON b.prospective_project_evaluation_id = c.prospective_project_evaluation_id
   WHERE a.lead_id = @lead_id;

   RETURN @l_project_name;
END;


