


CREATE PROCEDURE [dbo].[personnel_required_sel]
(
   @personnel_required_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.personnel_required_v WHERE 1 = 1';

	IF @personnel_required_id IS NOT NULL
		SET @stmt = @stmt + ' AND personnel_required_id='+ CAST((@personnel_required_id) AS VARCHAR(MAX));
	
	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));

	EXEC (@stmt);
END



