CREATE VIEW dbo.material_item_v
AS
SELECT        material_item_id, material_general_category_id, material_item_code, material_item_name, is_active, dbo.countMaterialType(material_item_id) AS countMaterialType, created_by, created_date, updated_by, 
                         updated_date
FROM            dbo.material_item
