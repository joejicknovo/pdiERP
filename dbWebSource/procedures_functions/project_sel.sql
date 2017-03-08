
CREATE PROCEDURE [dbo].[project_sel]
(
   @project_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.project_v WHERE 1 = 1 ';

	IF @project_id IS NOT NULL
		SET @stmt = @stmt + 'AND project_id=' + CAST((@project_id) AS VARCHAR(MAX));

	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id=' + CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));
		
	--print (@stmt);
	EXEC (@stmt);
END


