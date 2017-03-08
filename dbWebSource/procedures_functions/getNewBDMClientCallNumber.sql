CREATE FUNCTION [dbo].[getNewBDMClientCallNumber](
) 
RETURNS NVARCHAR(12) 
AS
BEGIN
	DECLARE @last_number VARCHAR(250);
	DECLARE @t_last_number VARCHAR(250);
	DECLARE @number NVARCHAR(12); 

	SET @last_number = (SELECT MAX(bdm_client_call_no) FROM dbo.bdm_client_call)
	SET @t_last_number = (SELECT SUBSTRING(@last_number, CHARINDEX('-', @last_number) + 1 , 250))
   
	SET @number = 'BCC'
	SET @number = @number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @number = @number + '-'
	SET @number = @number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_number) AS INT)) + 1, '1')), 4))

	RETURN @number;
END;