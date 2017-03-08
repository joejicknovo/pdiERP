

CREATE FUNCTION [dbo].[getNewLeadNumber](
) 
RETURNS NVARCHAR(10) 
AS
BEGIN
	DECLARE @last_lead_number VARCHAR(250);
	DECLARE @t_last_lead_number VARCHAR(250);
	DECLARE @lead_number NVARCHAR(10); 

	SET @last_lead_number = (SELECT MAX(lead_no) FROM dbo.lead)
	SET @t_last_lead_number = (SELECT SUBSTRING(@last_lead_number, CHARINDEX('-', @last_lead_number) + 1 , 250))
   
	SET @lead_number = 'L'
	SET @lead_number = @lead_number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @lead_number = @lead_number + '-'
	SET @lead_number = @lead_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_lead_number) AS INT)) + 1, '1')), 4))

	RETURN @lead_number;
END;
