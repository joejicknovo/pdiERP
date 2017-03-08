
create FUNCTION [dbo].[countMaterialsRequisitionSlipDetails](
	@materials_requisition_slip_id INT
) 
RETURNS INT 
AS
BEGIN
	DECLARE @count INT;

	SELECT 
		@count = COUNT(*) 
	FROM 
		dbo.materials_requisition_slip_detail_v 
	WHERE 
		1 = 1
	AND
		materials_requisition_slip_id = @materials_requisition_slip_id;

	RETURN @count;
END;

