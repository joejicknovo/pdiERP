CREATE VIEW dbo.materials_requisition_slip_detail_v
AS
SELECT        dbo.materials_requisition_slip_detail.materials_requisition_slip_detail_id, dbo.materials_requisition_slip_detail.materials_requisition_slip_id, dbo.materials_requisition_slip_detail.item_no, 
                         dbo.materials_requisition_slip_detail.item_id, dbo.material_v.material_item_full_name AS description, dbo.material_v.unit_of_measure_name, dbo.materials_requisition_slip_detail.qty, 
                         dbo.materials_requisition_slip_detail.qty_on_stock, dbo.materials_requisition_slip_detail.qty_issued, dbo.materials_requisition_slip_detail.qty_to_be_purchased, 
                         dbo.materials_requisition_slip_detail.is_active
FROM            dbo.materials_requisition_slip_detail INNER JOIN
                         dbo.material_v ON dbo.materials_requisition_slip_detail.item_id = dbo.material_v.material_id
