

CREATE FUNCTION [dbo].[isDuplicateMRSNumber](
	@mrs_no NVARCHAR(30)
	,@rev_no NVARCHAR(30)
) 
RETURNS INT
AS
BEGIN
	DECLARE @count INT;

	SET @count = (
		SELECT COUNT(materials_requisition_slip_id)
		FROM dbo.materials_requisition_slip
		WHERE 1 = 1
		AND mrs_no = '' + @mrs_no + ''
		AND rev_no = '' + @rev_no + ''
	);

	RETURN @count;
END;