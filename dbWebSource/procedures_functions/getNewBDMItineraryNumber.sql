


CREATE FUNCTION [dbo].[getNewBDMItineraryNumber](
) 
RETURNS NVARCHAR(20) 
AS
BEGIN
	DECLARE @last_reference_number VARCHAR(250);
	DECLARE @t_last_reference_number VARCHAR(250);
	DECLARE @reference_number NVARCHAR(20); 

	SET @last_reference_number = (SELECT MAX(bdm_itinerary_no) FROM dbo.bdm_itinerary)
	SET @t_last_reference_number = (SELECT SUBSTRING(@last_reference_number, CHARINDEX('-', @last_reference_number) + 1 , 250))
    
	SET @reference_number = 'BI'
	SET @reference_number = CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @reference_number = @reference_number + CONCAT('0', CAST(MONTH(GETDATE()) AS NVARCHAR(6)))
	SET @reference_number = @reference_number + '-'
	SET @reference_number = @reference_number + (SELECT RIGHT(CONCAT('00000', ISNULL((SELECT CAST((@t_last_reference_number) AS INT)) + 1, '1')), 5))

	RETURN @reference_number;
END;



