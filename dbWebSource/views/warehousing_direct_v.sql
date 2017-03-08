CREATE VIEW dbo.warehousing_direct_v
AS
SELECT        dbo.warehousing_detail.warehousing_detail_id, dbo.warehousing_detail.material_id, dbo.material_v.material_code, dbo.warehousing_detail.quantity, dbo.warehousing_detail.warehouse_id, 
                         dbo.warehouse.warehouse_name, dbo.warehousing_detail.rack_id, dbo.warehouse_rack.warehouse_rack_name, dbo.warehousing_detail.tag_no, dbo.warehousing_detail.expiration_date, 
                         dbo.warehousing_detail.warehousing_id, dbo.warehousing_detail.warehousing_return_id, dbo.material_v.material_item_full_name, dbo.getUnitOfMeasureNameByMaterIalId(dbo.material_v.unit_of_measure_id) 
                         AS unit_of_measure_name, dbo.getEmployeeFullName(dbo.warehousing_detail.updated_by) AS last_updated_by_name, dbo.convertDateTimeToString(dbo.warehousing_detail.updated_date) 
                         AS last_updated_by_date, dbo.material_v.material_description
FROM            dbo.warehousing_detail INNER JOIN
                         dbo.material_v ON dbo.warehousing_detail.material_id = dbo.material_v.material_id LEFT OUTER JOIN
                         dbo.warehouse_rack ON dbo.warehousing_detail.rack_id = dbo.warehouse_rack.warehouse_rack_id LEFT OUTER JOIN
                         dbo.warehouse ON dbo.warehousing_detail.warehouse_id = dbo.warehouse.warehouse_id
WHERE        (dbo.warehousing_detail.warehousing_id = 0) AND (dbo.warehousing_detail.warehousing_return_id IS NULL)
