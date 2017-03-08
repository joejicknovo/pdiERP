CREATE VIEW dbo.purchase_order_v
AS
SELECT        dbo.purchase_order.purchase_order_id, dbo.purchase_order.purchase_order_number, dbo.purchase_order.issued_date, dbo.purchase_order.to_id, dbo.supplier.supplier_name, dbo.purchase_order.ship_to_id, 
                         dbo.project_site.project_site_name, dbo.project_site.project_site_address, dbo.purchase_order.supplier_delivery_date, dbo.purchase_order.standard_delivery_date, dbo.purchase_order.term_id, dbo.terms.term, 
                         dbo.purchase_order.remarks, dbo.purchase_order.is_active, dbo.purchase_order.is_final, dbo.purchase_order.prepared_by, dbo.getEmployeeFullName(dbo.purchase_order.prepared_by) AS prepared_by_name, 
                         dbo.purchase_order.prepared_date, dbo.purchase_order.reviewed_by, dbo.getEmployeeFullName(dbo.purchase_order.reviewed_by) AS reviewed_by_name, dbo.purchase_order.reviewed_date, 
                         dbo.purchase_order.approved_by, dbo.getEmployeeFullName(dbo.purchase_order.approved_by) AS approved_by_name, dbo.purchase_order.approved_date, dbo.purchase_order.created_by, 
                         dbo.getEmployeeFullName(dbo.purchase_order.created_by) AS created_by_name, dbo.purchase_order.created_date, dbo.purchase_order.updated_by, 
                         dbo.getEmployeeFullName(dbo.purchase_order.updated_by) AS updated_by_name, dbo.purchase_order.updated_date, 
                         CASE dbo.purchase_order.is_final WHEN 'Y' THEN 'Final' ELSE 'Draft' END AS po_status
FROM            dbo.purchase_order INNER JOIN
                         dbo.supplier ON dbo.purchase_order.to_id = dbo.supplier.supplier_id INNER JOIN
                         dbo.project_site ON dbo.purchase_order.ship_to_id = dbo.project_site.project_site_id INNER JOIN
                         dbo.terms ON dbo.purchase_order.term_id = dbo.terms.term_id
