CREATE VIEW dbo.warehousing_detail_v
AS
SELECT        dbo.warehousing_detail.warehousing_detail_id, dbo.warehousing_detail.warehousing_id, dbo.warehousing_detail.material_id, dbo.warehousing_detail.quantity, dbo.warehousing_detail.warehouse_id, 
                         dbo.warehouse.warehouse_name, dbo.warehousing_detail.rack_id, dbo.warehouse_rack.warehouse_rack_name, dbo.warehousing_detail.tag_no, dbo.warehousing_detail.expiration_date, 
                         dbo.warehousing_detail.warehousing_return_id, dbo.warehousing_detail.created_by, dbo.warehousing_detail.created_date, dbo.warehousing_detail.updated_by, dbo.warehousing_detail.updated_date, 
                         dbo.material.unit_of_measure_id, dbo.unit_of_measure.unit_of_measure_name, dbo.getMaterialCurrentUnitCost(dbo.warehousing_detail.material_id) AS unit_price
FROM            dbo.warehousing_detail INNER JOIN
                         dbo.material ON dbo.warehousing_detail.material_id = dbo.material.material_id INNER JOIN
                         dbo.warehousing ON dbo.warehousing_detail.warehousing_id = dbo.warehousing.warehousing_id INNER JOIN
                         dbo.warehouse ON dbo.warehousing_detail.warehouse_id = dbo.warehouse.warehouse_id INNER JOIN
                         dbo.warehousing_return ON dbo.warehousing_detail.warehousing_return_id = dbo.warehousing_return.warehousing_return_id INNER JOIN
                         dbo.warehouse_rack ON dbo.warehousing_detail.rack_id = dbo.warehouse_rack.warehouse_rack_id INNER JOIN
                         dbo.unit_of_measure ON dbo.material.unit_of_measure_id = dbo.unit_of_measure.unit_of_measure_id
