CREATE VIEW dbo.material_v
AS
SELECT        dbo.material.material_id, dbo.material.material_code, dbo.material_classification.material_classification_name, dbo.material_general_category.material_general_category_name, 
                         dbo.material_item.material_item_name, dbo.material_type.material_type_name, dbo.material_attribute_size_capacity.material_attribute_size_capacity_name, 
                         dbo.material_length_weight_rating.material_length_weight_rating_name, dbo.material_color_schedule_grade.material_color_schedule_grade_name, dbo.material.material_classification_id, 
                         dbo.material.material_general_category_id, dbo.material.material_item_id, dbo.material.material_type_id, dbo.material.material_attribute_size_capacity_id, dbo.material.material_length_weight_rating_id, 
                         dbo.material.material_color_schedule_grade_id, dbo.material.additional_specification, dbo.material_brand.material_brand_name, dbo.material.material_brand_id, dbo.material.unit_of_measure_id, 
                         dbo.unit_of_measure.unit_of_measure_name, dbo.material.image_filename, dbo.material_classification.material_classification_code, dbo.material_general_category.material_general_category_code, 
                         dbo.material_item.material_item_code, dbo.material_type.material_type_code, dbo.material_attribute_size_capacity.material_attribute_size_capacity_code, 
                         dbo.material_length_weight_rating.material_length_weight_rating_code, dbo.material_color_schedule_grade.material_color_schedule_grade_code, dbo.material.is_active, dbo.material.created_by, 
                         dbo.material.created_date, dbo.material.updated_by, dbo.material.updated_date, 
                         dbo.material.material_code + ': ' + dbo.material_classification.material_classification_name + ', ' + dbo.material_general_category.material_general_category_name + ', ' + dbo.material_item.material_item_name +
                          ', ' + dbo.material_type.material_type_name + ', ' + dbo.material_attribute_size_capacity.material_attribute_size_capacity_name + ', ' + dbo.material_length_weight_rating.material_length_weight_rating_name + ', '
                          + dbo.material_color_schedule_grade.material_color_schedule_grade_name + ', ' + dbo.material.additional_specification + ', ' + dbo.material_brand.material_brand_name AS material_item_full_name, 
                         dbo.getMaterialCurrentUnitCost(dbo.material.material_id) AS unit_cost, dbo.getMaterialCurrentUnitCost(dbo.material.material_id) AS unit_cost_label, 
                         dbo.material_classification.material_classification_name + N', ' + dbo.material_general_category.material_general_category_name + N', ' + dbo.material_item.material_item_name + N', ' + dbo.material_type.material_type_name
                          + N', ' + dbo.material_attribute_size_capacity.material_attribute_size_capacity_name + N', ' + dbo.material_length_weight_rating.material_length_weight_rating_name + N', ' + dbo.material_color_schedule_grade.material_color_schedule_grade_name
                          + N', ' + dbo.material.additional_specification + N', ' + dbo.material_brand.material_brand_name AS material_description
FROM            dbo.material_color_schedule_grade RIGHT OUTER JOIN
                         dbo.unit_of_measure RIGHT OUTER JOIN
                         dbo.material ON dbo.unit_of_measure.unit_of_measure_id = dbo.material.unit_of_measure_id LEFT OUTER JOIN
                         dbo.material_length_weight_rating ON dbo.material.material_length_weight_rating_id = dbo.material_length_weight_rating.material_length_weight_rating_id ON 
                         dbo.material_color_schedule_grade.material_color_schedule_grade_id = dbo.material.material_color_schedule_grade_id LEFT OUTER JOIN
                         dbo.material_type ON dbo.material.material_type_id = dbo.ma