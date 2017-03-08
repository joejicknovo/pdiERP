
CREATE PROCEDURE [dbo].[programme_sel]
(
   @programme_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.programme WHERE 1 = 1';

	IF @programme_id IS NOT NULL
		SET @stmt = @stmt + ' AND programme_id='+ CAST((@programme_id) AS VARCHAR(MAX));

	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));
	
	PRINT (@stmt);
	EXEC (@stmt);
END

