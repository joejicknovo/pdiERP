

CREATE FUNCTION [dbo].[getMaterialCurrentUnitCost] 
(
	@material_id INT 
)
RETURNS DECIMAL(18,2)
AS
BEGIN
	DECLARE @current DECIMAL(18,2);

	SELECT @current = unit_cost 
	FROM dbo.purchase_order_detail 
	WHERE material_id = @material_id
	AND created_date = (SELECT MAX(created_date) FROM dbo.purchase_order_detail WHERE material_id = @material_id)
	GROUP BY unit_cost

    RETURN @current;

END

