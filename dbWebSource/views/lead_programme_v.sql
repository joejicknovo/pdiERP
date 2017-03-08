CREATE VIEW dbo.lead_programme_v
AS
SELECT        dbo.prospective_project_evaluation.lead_id, dbo.programme.programme_id, dbo.programme.prospective_project_evaluation_id, dbo.programme.duration, dbo.programme.prebid_conference, 
                         dbo.programme.site_inspection, dbo.programme.bid_submission
FROM            dbo.programme LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.programme.prospective_project_evaluation_id = dbo.prospective_project_evaluation.prospective_project_evaluation_id
