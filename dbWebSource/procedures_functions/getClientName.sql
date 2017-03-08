

CREATE FUNCTION [dbo].[getClientName](
	@client_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_customer_name VARCHAR(100); 

   SELECT @l_customer_name = customer_name 
   FROM dbo.client 
   WHERE client_id = @client_id
   AND is_active = 'Y';

   RETURN @l_customer_name;
END;

