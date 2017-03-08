CREATE VIEW dbo.contract_particular_programme_v
AS
SELECT        dbo.contract_particular_programme.contract_particular_programme_id, dbo.contract_particular_programme.contract_particular_id, dbo.contract_particular_programme.programme_id, dbo.programme.duration, 
                         dbo.programme.prebid_conference, dbo.programme.site_inspection, dbo.programme.bid_submission, dbo.contract_particular_programme.commencement_date, 
                         dbo.contract_particular_programme.contractual_completion_date
FROM            dbo.contract_particular_programme LEFT OUTER JOIN
                         dbo.programme ON dbo.contract_particular_programme.programme_id = dbo.programme.programme_id
