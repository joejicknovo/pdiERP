

CREATE FUNCTION [dbo].[getNewMRSNumber](
) 
RETURNS NVARCHAR(10) 
AS
BEGIN
	DECLARE @last_mrs_number VARCHAR(250);
	DECLARE @t_last_mrs_number VARCHAR(250);
	DECLARE @mrs_number NVARCHAR(10); 

	SET @last_mrs_number = (SELECT MAX(mrs_no) FROM dbo.materials_requisition_slip)
	SET @t_last_mrs_number = (SELECT SUBSTRING(@last_mrs_number, CHARINDEX('-', @last_mrs_number) + 1 , 250))
   
	SET @mrs_number = CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @mrs_number = @mrs_number + '-'
	SET @mrs_number = @mrs_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_mrs_number) AS INT)) + 1, '1')), 4))

	RETURN @mrs_number;
END;