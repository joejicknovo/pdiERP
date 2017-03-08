

CREATE FUNCTION [dbo].[getNewBidCode](
) 
RETURNS NVARCHAR(10) 
AS
BEGIN
	DECLARE @last_bid_number VARCHAR(250);
	DECLARE @t_last_bid_number VARCHAR(250);
	DECLARE @bid_number NVARCHAR(10); 

	SET @last_bid_number = (SELECT MAX(bid_code) FROM dbo.bid)
	SET @t_last_bid_number = (SELECT SUBSTRING(@last_bid_number, CHARINDEX('-', @last_bid_number) + 1 , 250))
   
	SET @bid_number = 'B'
	SET @bid_number = @bid_number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @bid_number = @bid_number + '-'
	SET @bid_number = @bid_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_bid_number) AS INT)) + 1, '1')), 4))

	RETURN @bid_number;
END;
