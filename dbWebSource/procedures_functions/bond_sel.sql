
CREATE PROCEDURE [dbo].[bond_sel]
(
   @bond_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.bond WHERE 1=1';

	IF @bond_id IS NOT NULL
		SET @stmt = @stmt + ' ANd bond_id='+ CAST((@bond_id) AS VARCHAR(MAX));
	
	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));

	EXEC (@stmt);
END

