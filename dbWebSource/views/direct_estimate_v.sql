CREATE VIEW dbo.direct_estimate_v
AS
SELECT        dbo.direct_estimate.direct_estimate_id, dbo.direct_estimate.doc_code, dbo.direct_estimate.rev_no, dbo.direct_estimate.effectivity_date, dbo.direct_estimate.direct_estimate_no, dbo.direct_estimate.project_id, 
                         dbo.project.project_name, dbo.project_site.project_site_name AS location, dbo.direct_estimate.subject, dbo.direct_estimate.status_id, dbo.getStatusName(dbo.direct_estimate.status_id) AS status_name, 
                         dbo.direct_estimate.is_active, dbo.direct_estimate.prepared_by, dbo.getEmployeeFullName(dbo.direct_estimate.prepared_by) AS prepared_by_name, dbo.direct_estimate.prepared_date, 
                         dbo.direct_estimate.reviewed_by, dbo.getEmployeeFullName(dbo.direct_estimate.reviewed_by) AS reviewed_by_name, dbo.direct_estimate.reviewed_date, dbo.direct_estimate.approved_by, 
                         dbo.getEmployeeFullName(dbo.direct_estimate.approved_by) AS approved_by_name, dbo.direct_estimate.approved_date, dbo.direct_estimate.created_by, 
                         dbo.getEmployeeFullName(dbo.direct_estimate.created_by) AS created_by_name, dbo.direct_estimate.created_date, dbo.direct_estimate.updated_by, dbo.getEmployeeFullName(dbo.direct_estimate.updated_by) 
                         AS updated_by_name, dbo.direct_estimate.updated_date, dbo.countDirectEstimateDetails(dbo.direct_estimate.direct_estimate_id) AS countDirectEstimateDetails
FROM            dbo.direct_estimate INNER JOIN
                         dbo.project ON dbo.direct_estimate.project_id = dbo.project.project_id INNER JOIN
                         dbo.project_site ON dbo.project.project_location_id = dbo.project_site.project_site_id
