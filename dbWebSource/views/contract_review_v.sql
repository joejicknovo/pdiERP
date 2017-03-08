CREATE VIEW dbo.contract_review_v
AS
SELECT        dbo.contract_review.contract_review_id, dbo.contract_review.contract_review_no, dbo.contract_review.project_id, dbo.getProjectName(dbo.contract_review.project_id) AS project_name, 
                         dbo.project_site.project_site_name AS project_location, dbo.contract_review.subject, dbo.contract_review.contract_review_date, dbo.contract_review.created_by, dbo.contract_review.created_date, 
                         dbo.contract_review.updated_by, dbo.contract_review.updated_date
FROM            dbo.contract_review INNER JOIN
                         dbo.project ON dbo.contract_review.project_id = dbo.project.project_id INNER JOIN
                         dbo.project_site ON dbo.project.project_location_id = dbo.project_site.project_site_id
