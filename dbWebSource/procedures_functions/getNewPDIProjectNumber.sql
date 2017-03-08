

CREATE FUNCTION [dbo].[getNewPDIProjectNumber](
) 
RETURNS NVARCHAR(50) 
AS
BEGIN
	DECLARE @last_PDIProject_number VARCHAR(250);
	DECLARE @t_last_PDIProject_number VARCHAR(250);
	DECLARE @PDIProject_number NVARCHAR(50); 

	SET @last_PDIProject_number = (SELECT MAX(pdi_project_no) FROM dbo.contract_particular_project)
	SET @t_last_PDIProject_number = (SELECT SUBSTRING(@last_PDIProject_number, CHARINDEX('000', @last_PDIProject_number) + 1 , 250))
	
	SET @PDIProject_number = 'PDI-P'
	SET @PDIProject_number = @PDIProject_number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @PDIProject_number = @PDIProject_number + '-'
	SET @PDIProject_number = @PDIProject_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_PDIProject_number) AS INT)) + 1, '1')), 4))
	
	RETURN @PDIProject_number;
END;
