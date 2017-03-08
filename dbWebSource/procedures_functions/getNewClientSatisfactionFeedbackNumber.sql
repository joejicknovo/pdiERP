


CREATE FUNCTION [dbo].[getNewClientSatisfactionFeedbackNumber](
) 
RETURNS NVARCHAR(10) 
AS
BEGIN
	DECLARE @last_feedback_number VARCHAR(250);
	DECLARE @t_last_feedback_number VARCHAR(250);
	DECLARE @feedback_number NVARCHAR(10); 

	SET @last_feedback_number = (SELECT MAX(document_no) FROM dbo.client_satisfaction_feedback)
	SET @t_last_feedback_number = (SELECT SUBSTRING(@last_feedback_number, CHARINDEX('-', @last_feedback_number) + 1 , 250))
   
	SET @feedback_number = 'F'
	SET @feedback_number = @feedback_number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @feedback_number = @feedback_number + '-'
	SET @feedback_number = @feedback_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_feedback_number) AS INT)) + 1, '1')), 4))

	RETURN @feedback_number;
END;

