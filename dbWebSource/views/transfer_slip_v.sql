CREATE VIEW dbo.transfer_slip_v
AS
SELECT        transfer_slip_id, transfer_slip_no, transfer_slip_date, transfer_from, dbo.getProjectLocation(transfer_from) AS transfer_from_name, transfer_to, dbo.getProjectLocation(transfer_to) AS transfer_to_name, status_id, 
                         dbo.getStatusName(status_id) AS status_name, document_code, revision_no, effective_date, prepared_by, dbo.getEmployeeFullName(prepared_by) AS prepared_by_name, prepared_date, approved_by, 
                         dbo.getEmployeeFullName(approved_by) AS approved_by_name, approved_date, received_by, dbo.getEmployeeFullName(received_by) AS received_by_name, received_date, updated_by, 
                         dbo.getEmployeeFullName(updated_by) AS modified_by_name, updated_date
FROM            dbo.transfer_slip
