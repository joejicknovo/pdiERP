CREATE VIEW dbo.materials_requisition_slip_v
AS
SELECT        dbo.materials_requisition_slip.materials_requisition_slip_id, dbo.materials_requisition_slip.doc_code, dbo.materials_requisition_slip.rev_no, dbo.materials_requisition_slip.effectivity_date, 
                         dbo.materials_requisition_slip.mrs_no, dbo.materials_requisition_slip.mrs_date, dbo.materials_requisition_slip.project_id, dbo.project.project_name, dbo.project.project_no, 
                         dbo.materials_requisition_slip.needed_date, dbo.materials_requisition_slip.dr_no, dbo.materials_requisition_slip.po_no, dbo.materials_requisition_slip.status_id, 
                         dbo.getStatusName(dbo.materials_requisition_slip.status_id) AS status_name, dbo.materials_requisition_slip.is_active, dbo.materials_requisition_slip.requested_by, 
                         dbo.getEmployeeFullName(dbo.materials_requisition_slip.requested_by) AS requested_by_name, dbo.materials_requisition_slip.requested_date, dbo.materials_requisition_slip.noted_by, 
                         dbo.getEmployeeFullName(dbo.materials_requisition_slip.noted_by) AS noted_by_name, dbo.materials_requisition_slip.noted_date, dbo.materials_requisition_slip.checked_by, 
                         dbo.getEmployeeFullName(dbo.materials_requisition_slip.checked_by) AS checked_by_name, dbo.materials_requisition_slip.checked_date, dbo.materials_requisition_slip.approved_by, 
                         dbo.getEmployeeFullName(dbo.materials_requisition_slip.approved_by) AS approved_by_name, dbo.materials_requisition_slip.approved_date, dbo.materials_requisition_slip.created_by, 
                         dbo.getEmployeeFullName(dbo.materials_requisition_slip.created_by) AS created_by_name, dbo.materials_requisition_slip.created_date, dbo.materials_requisition_slip.updated_by, 
                         dbo.getEmployeeFullName(dbo.materials_requisition_slip.updated_by) AS updated_by_name, dbo.materials_requisition_slip.updated_date, 
                         dbo.countMaterialsRequisitionSlipDetails(dbo.materials_requisition_slip.materials_requisition_slip_id) AS countMaterialsRequisitionSlipDetails
FROM            dbo.materials_requisition_slip INNER JOIN
                         dbo.project ON dbo.materials_requisition_slip.project_id = dbo.project.project_id
