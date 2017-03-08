

CREATE FUNCTION [dbo].[getNewWarehouseReleasingNumber](
) 
RETURNS NVARCHAR(11) 
AS
BEGIN
	DECLARE @last_wrn_number VARCHAR(250);
	DECLARE @t_last_wrn_number VARCHAR(250);
	DECLARE @wrn_number NVARCHAR(11); 

	SET @last_wrn_number = (SELECT MAX(warehouse_releasing_no) FROM dbo.warehouse_releasing)
	SET @t_last_wrn_number = (SELECT SUBSTRING(@last_wrn_number, CHARINDEX('-', @last_wrn_number) + 1 , 250))
   
	SET @wrn_number = 'WR'
	SET @wrn_number = @wrn_number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @wrn_number = @wrn_number + '-'
	SET @wrn_number = @wrn_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_wrn_number) AS INT)) + 1, '1')), 4))

	RETURN @wrn_number;
END;


