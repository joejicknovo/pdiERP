
CREATE PROCEDURE [dbo].[contract_particular_programme_sel]
(
   @contract_particular_programme_id INT = NULL,
   @contract_particular_id INT = NULL
)
AS

BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.contract_particular_programme_v WHERE 1 = 1';

	IF @contract_particular_programme_id IS NOT NULL
		SET @stmt = @stmt + ' AND contract_particular_programme_id='+ CAST((@contract_particular_programme_id) AS VARCHAR(MAX));

	IF @contract_particular_id IS NOT NULL
		SET @stmt = @stmt + ' AND contract_particular_id='+ CAST((@contract_particular_id) AS VARCHAR(MAX));
	
	--PRINT (@stmt);
	EXEC (@stmt);

END


