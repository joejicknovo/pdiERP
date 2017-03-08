
CREATE FUNCTION [dbo].[getUnitOfMeasureNameByMaterIalId](
	@material_id INT
) 
RETURNS VARCHAR(100) 
AS
BEGIN
   DECLARE @l_unit_of_measure_name VARCHAR(100); 

   SELECT @l_unit_of_measure_name = unit_of_measure_name 
   FROM dbo.unit_of_measure
   WHERE unit_of_measure_id = @material_id

   RETURN @l_unit_of_measure_name;
END;