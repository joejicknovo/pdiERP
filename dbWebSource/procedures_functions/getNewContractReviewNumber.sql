

CREATE FUNCTION [dbo].[getNewContractReviewNumber](
) 
RETURNS NVARCHAR(12) 
AS
BEGIN
	DECLARE @last_contract_review_number VARCHAR(250);
	DECLARE @t_last_contract_review_number VARCHAR(250);
	DECLARE @contract_review_number NVARCHAR(12); 

	SET @last_contract_review_number = (SELECT MAX(contract_review_no) FROM dbo.contract_review)
	SET @t_last_contract_review_number = (SELECT SUBSTRING(@last_contract_review_number, CHARINDEX('-', @last_contract_review_number) + 1 , 250))
   
	SET @contract_review_number = 'CR'
	SET @contract_review_number = @contract_review_number + CAST(YEAR(GETDATE()) AS NVARCHAR(6))
	SET @contract_review_number = @contract_review_number + '-'
	SET @contract_review_number = @contract_review_number + (SELECT RIGHT(CONCAT('0000', ISNULL((SELECT CAST((@t_last_contract_review_number) AS INT)) + 1, '1')), 4))

	RETURN @contract_review_number;
END;


