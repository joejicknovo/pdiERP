


CREATE FUNCTION [dbo].[getWarehouseCodeName](
	@warehouse_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_name VARCHAR(1000); 

   SELECT @l_name = warehouse_code + ': ' + warehouse_name
   FROM dbo.warehouse WHERE warehouse_id = @warehouse_id

   RETURN @l_name;
END;

