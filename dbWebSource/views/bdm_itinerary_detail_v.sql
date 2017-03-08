CREATE VIEW dbo.bdm_itinerary_detail_v
AS
SELECT        dbo.bdm_itinerary_detail.bdm_itinerary_detail_id, dbo.bdm_itinerary_detail.bdm_itinerary_id, dbo.bdm_itinerary_detail.day_id, dbo.status.status_name AS day_name, dbo.bdm_itinerary_detail.time, 
                         dbo.bdm_itinerary_detail.client_id, dbo.getClientName(dbo.bdm_itinerary_detail.client_id) AS client_name, dbo.bdm_itinerary_detail.address, dbo.bdm_itinerary_detail.contact_person, 
                         dbo.bdm_itinerary_detail.created_by, dbo.bdm_itinerary_detail.created_date, dbo.bdm_itinerary_detail.updated_by, dbo.bdm_itinerary_detail.updated_date
FROM            dbo.bdm_itinerary_detail INNER JOIN
                         dbo.status ON dbo.bdm_itinerary_detail.day_id = dbo.status.status_id
