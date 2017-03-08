CREATE VIEW dbo.material_type_v
AS
SELECT        material_type_id, material_item_id, material_type_code, material_type_name, is_active, dbo.countMaterialAttributeSizeCapacity(material_type_id) AS countMaterialAttributeSizeCapacity, created_by, 
                         created_date, updated_by, updated_date
FROM            dbo.material_type
