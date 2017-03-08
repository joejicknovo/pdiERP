


CREATE PROCEDURE [dbo].[lead_commercial_condition_sel]
(
   @lead_id INT= NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.lead_commercial_condition_v WHERE 1 = 1';

	IF @lead_id IS NOT NULL
		SET @stmt = @stmt + ' AND lead_id='+ CAST((@lead_id) AS VARCHAR(MAX));
	
	--PRINT (@stmt);
	EXEC (@stmt);
END



