


CREATE PROCEDURE [dbo].[other_relevant_information_sel]
(
   @other_relevant_information_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.other_relevant_information WHERE 1=1';

	IF @other_relevant_information_id IS NOT NULL
		SET @stmt = @stmt + ' AND other_relevant_information_id='+ CAST((@other_relevant_information_id) AS VARCHAR(MAX));
	
	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));

	EXEC (@stmt);
END



