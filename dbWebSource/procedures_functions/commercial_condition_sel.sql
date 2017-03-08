

CREATE PROCEDURE [dbo].[commercial_condition_sel]
(
   @commercial_condition_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.commercial_condition WHERE 1 = 1';

	IF @commercial_condition_id IS NOT NULL
		SET @stmt = @stmt + ' AND commercial_condition_id='+ CAST((@commercial_condition_id) AS VARCHAR(MAX));
	
	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));

	PRINT (@stmt);
	EXEC (@stmt);
END


