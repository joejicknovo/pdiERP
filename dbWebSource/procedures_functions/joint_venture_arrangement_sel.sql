
CREATE PROCEDURE [dbo].[joint_venture_arrangement_sel]
(
	@joint_venture_arrangement_id INT = NULL,
    @contract_particular_id INT = NULL
)
AS

BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.joint_venture_arrangement WHERE 1 = 1';

	IF @joint_venture_arrangement_id IS NOT NULL
		SET @stmt = @stmt + ' AND joint_venture_arrangement_id='+ CAST((@joint_venture_arrangement_id) AS VARCHAR(MAX));

	IF @contract_particular_id IS NOT NULL
		SET @stmt = @stmt + ' AND contract_particular_id='+ CAST((@contract_particular_id) AS VARCHAR(MAX));
	
	--PRINT (@stmt);
	EXEC (@stmt);
END


