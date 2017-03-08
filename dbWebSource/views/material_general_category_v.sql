CREATE VIEW dbo.material_general_category_v
AS
SELECT        material_general_category_id, material_classification_id, material_general_category_code, material_general_category_name, is_active, dbo.countMaterialItem(material_general_category_id) 
                         AS countMaterialItem, created_by, created_date, updated_by, updated_date
FROM            dbo.material_general_category
