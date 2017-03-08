

CREATE FUNCTION [dbo].[getNewClientNumber](
) 
RETURNS NVARCHAR(10) 
AS
BEGIN
   DECLARE @client_number NVARCHAR(10); 
   
   SET @client_number = (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((SELECT MAX(client_number) FROM dbo.client) AS INT)) + 1, '1')), 4))

   RETURN @client_number;
END;
