CREATE VIEW dbo.contract_particular_other_relevant_information_v
AS
SELECT        contract_particular_other_relevant_information_id, contract_particular_id, description AS cp_description
FROM            dbo.contract_particular_other_relevant_information
