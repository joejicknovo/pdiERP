CREATE VIEW dbo.purchase_order_detail_v
AS
SELECT        dbo.purchase_order_detail.purchase_order_detail_id, dbo.purchase_order_detail.purchase_order_id, dbo.purchase_order_detail.quantity, dbo.purchase_order_detail.item_id, 
                         dbo.material_v.material_item_full_name, dbo.purchase_order_detail.description, dbo.purchase_order_detail.is_active
FROM            dbo.purchase_order_detail INNER JOIN
                         dbo.material_v ON dbo.purchase_order_detail.item_id = dbo.material_v.material_id
