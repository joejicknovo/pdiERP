CREATE VIEW dbo.material_length_weight_rating_v
AS
SELECT        material_length_weight_rating_id, material_attribute_size_capacity_id, material_length_weight_rating_code, material_length_weight_rating_name, is_active, 
                         dbo.countMaterialColorScheduleGrade(material_length_weight_rating_id) AS countMaterialColorScheduleGrade, created_by, created_date, updated_by, updated_date
FROM            dbo.material_length_weight_rating
