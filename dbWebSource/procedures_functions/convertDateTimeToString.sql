-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION convertDateTimeToString 
(
	@date_time DATETIME
)
RETURNS NVARCHAR(18)
AS
	BEGIN
		DECLARE @dateTimeString NVARCHAR(18);
		DECLARE @date NVARCHAR(10);
		DECLARE @time NVARCHAR(7);

		SET @date = (SELECT LEFT(CONVERT(VARCHAR, @date_time, 101), 10));
		SET @time = (SELECT CONVERT(VARCHAR(15), CAST(@date_time AS TIME), 100));
		SET @dateTimeString = @date + ' ' + @time;
		
		RETURN @dateTimeString;
	END
