CREATE VIEW dbo.bdm_client_call_v
AS
SELECT        dbo.bdm_client_call.bdm_client_call_id, dbo.bdm_client_call.bdm_client_call_no, dbo.bdm_client_call.document_code, dbo.bdm_client_call.revision_no, dbo.bdm_client_call.effective_date, 
                         dbo.bdm_client_call.date_visit, dbo.bdm_client_call.client_id, dbo.client.customer_name, dbo.client.address, dbo.client.contact_person, dbo.bdm_client_call.detail_visit, dbo.bdm_client_call.next_action, 
                         dbo.bdm_client_call.remarks, dbo.bdm_client_call.prepared_by, dbo.bdm_client_call.prepared_date, dbo.bdm_client_call.reviewed_by, dbo.bdm_client_call.reviewed_date, dbo.bdm_client_call.approved_by, 
                         dbo.bdm_client_call.approved_date
FROM            dbo.bdm_client_call LEFT OUTER JOIN
                         dbo.client ON dbo.bdm_client_call.client_id = dbo.client.client_id
