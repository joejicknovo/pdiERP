

CREATE PROCEDURE [dbo].[lead_prospective_project_evaluation_sel]
(
   @lead_id INT= NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.prospective_project_evaluation';

	IF @lead_id IS NOT NULL
		SET @stmt = @stmt + ' WHERE lead_id='+ CAST((@lead_id) AS VARCHAR(MAX));
	
	EXEC (@stmt);
END


