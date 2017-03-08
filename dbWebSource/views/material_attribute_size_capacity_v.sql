CREATE VIEW dbo.material_attribute_size_capacity_v
AS
SELECT        material_attribute_size_capacity_id, material_type_id, material_attribute_size_capacity_code, material_attribute_size_capacity_name, is_active, 
                         dbo.countMaterialLengthWeightRating(material_attribute_size_capacity_id) AS countMaterialLengthWeightRating, created_by, created_date, updated_by, updated_date
FROM            dbo.material_attribute_size_capacity
