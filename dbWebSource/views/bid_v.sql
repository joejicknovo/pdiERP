CREATE VIEW dbo.bid_v
AS
SELECT        bid_id, bid_code, bid_date, bid_type_id, dbo.getStatusName(bid_type_id) AS bid_type_name, project_id, dbo.getProjectName(project_id) AS project_name, project_type_id, dbo.getStatusName(project_type_id) 
                         AS project_type_name, direct_cost, extended_cost, selling_cost, submission_date, duration, client_id, dbo.getClientName(client_id) AS client_name, prebid_datetime_conference, prebid_venue_conference, 
                         site_datetime_inspection, site_venue_inspection, submission_courier, submission_email, submission_hardcopy, validity_of_bid, bid_document_amount, status_id, dbo.getStatusName(status_id) 
                         AS status_name, remark, prepared_by, dbo.getEmployeeFullName(prepared_by) AS prepared_by_name, prepared_date, updated_by, dbo.getEmployeeFullName(updated_by) AS modified_by_name, 
                         updated_date AS modified_date
FROM            dbo.bid
