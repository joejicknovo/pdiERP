


CREATE PROCEDURE [dbo].[insurance_sel]
(
   @insurance_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.insurance WHERE 1=1';

	IF @insurance_id IS NOT NULL
		SET @stmt = @stmt + ' AND insurance_id='+ CAST((@insurance_id) AS VARCHAR(MAX));
	
	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));

	EXEC (@stmt);
END



