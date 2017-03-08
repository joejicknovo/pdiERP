
CREATE FUNCTION [dbo].[getNewProjectNumber](
) 
RETURNS NVARCHAR(10) 
AS
BEGIN
	DECLARE @last_project_number VARCHAR(250);
	DECLARE @t_last_project_number VARCHAR(250);
	DECLARE @project_number NVARCHAR(10); 

	SET @last_project_number = (SELECT MAX(project_no) FROM dbo.project)
	SET @t_last_project_number = (SELECT SUBSTRING(@last_project_number, CHARINDEX('-', @last_project_number) + 1 , 250))
   
	SET @project_number = 'P'
	SET @project_number = @project_number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @project_number = @project_number + '-'
	SET @project_number = @project_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_project_number) AS INT)) + 1, '1')), 4))

	RETURN @project_number;
END;

