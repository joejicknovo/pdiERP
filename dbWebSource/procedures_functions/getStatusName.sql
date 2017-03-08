
CREATE FUNCTION [dbo].[getStatusName](
	@status_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_status_name VARCHAR(100); 

   SELECT @l_status_name = status_name 
   FROM dbo.status
   WHERE status_id = @status_id;

   RETURN @l_status_name;
END;


