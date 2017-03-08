

create FUNCTION [dbo].[getCommercialConditionContractType](
	@commercial_condition_id int
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_contract_type VARCHAR(100); 

   SELECT @l_contract_type = contract_type 
   FROM [dbo].[commercial_condition]
   WHERE [commercial_condition_id] = @commercial_condition_id;

   RETURN @l_contract_type;
END;

