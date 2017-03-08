

CREATE FUNCTION [dbo].[countOperationIssueRegisterDetails](
	@operation_issue_register_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.operation_issue_register_detail
   WHERE operation_issue_register_id = @operation_issue_register_id;

   RETURN @count;
END;


