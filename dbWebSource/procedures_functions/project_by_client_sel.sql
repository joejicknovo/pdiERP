
CREATE PROCEDURE [dbo].[project_by_client_sel]
(
   @client_id INT
)
AS
BEGIN
	SET NOCOUNT OFF;

	SELECT 
		project_id, project_name 
	FROM dbo.project_v 
	WHERE 1 = 1
	AND client_id = @client_id
	ORDER BY project_name
	
END
