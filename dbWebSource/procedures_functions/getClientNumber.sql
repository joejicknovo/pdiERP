

CREATE FUNCTION [dbo].[getClientNumber](
	@client_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_client_number VARCHAR(100); 

   SELECT @l_client_number = client_number 
   FROM dbo.client 
   WHERE client_id = @client_id
   AND is_active = 'Y';

   RETURN @l_client_number;
END;

