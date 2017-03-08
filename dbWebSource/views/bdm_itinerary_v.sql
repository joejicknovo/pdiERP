CREATE VIEW dbo.bdm_itinerary_v
AS
SELECT        dbo.bdm_itinerary.bdm_itinerary_id, dbo.bdm_itinerary.bdm_itinerary_no, dbo.bdm_itinerary.document_code, dbo.bdm_itinerary.revision_no, dbo.bdm_itinerary.effective_date, dbo.bdm_itinerary.status_id, 
                         dbo.status.status_name, dbo.bdm_itinerary.prepared_by, dbo.getEmployeeFullName(dbo.bdm_itinerary.prepared_by) AS prepared_by_name, dbo.bdm_itinerary.prepared_date, dbo.bdm_itinerary.reviewed_by, 
                         dbo.getEmployeeFullName(dbo.bdm_itinerary.reviewed_by) AS reviewed_by_name, dbo.bdm_itinerary.reviewed_date, dbo.bdm_itinerary.approved_by, 
                         dbo.getEmployeeFullName(dbo.bdm_itinerary.approved_by) AS approved_by_name, dbo.bdm_itinerary.approved_date, dbo.bdm_itinerary.updated_by, dbo.bdm_itinerary.updated_date, 
                         dbo.countItineraryDetails(dbo.bdm_itinerary.bdm_itinerary_id) AS countItineraryDetails
FROM            dbo.bdm_itinerary INNER JOIN
                         dbo.status ON dbo.bdm_itinerary.status_id = dbo.status.status_id
