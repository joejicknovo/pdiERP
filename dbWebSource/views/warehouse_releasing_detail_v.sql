CREATE VIEW dbo.warehouse_releasing_detail_v
AS
SELECT        dbo.warehouse_releasing_detail.warehouse_releasing_detail_id, dbo.warehouse_releasing_detail.warehouse_releasing_id, dbo.warehouse_releasing_detail.material_id, dbo.material.material_code, 
                         dbo.material_item.material_item_name + ' ' + dbo.material_type.material_type_name AS material_name, dbo.warehouse_releasing_detail.unit_of_measure_id, dbo.unit_of_measure.unit_of_measure_code, 
                         dbo.unit_of_measure.unit_of_measure_name, dbo.warehouse_releasing_detail.unit_cost, dbo.warehouse_releasing_detail.unit_cost AS unit_cost_label, dbo.warehouse_releasing_detail.quantity, 
                         dbo.warehouse_releasing_detail.amount, 
                         dbo.material.material_code + ': ' + dbo.material_item.material_item_name + ', ' + dbo.material_type.material_type_name + ', ' + dbo.material_item.material_item_name + ', ' + dbo.material_attribute_size_capacity.material_attribute_size_capacity_name
                          + ', ' + dbo.material_length_weight_rating.material_length_weight_rating_name AS material_item_full_name
FROM            dbo.unit_of_measure RIGHT OUTER JOIN
                         dbo.warehouse_releasing_detail ON dbo.unit_of_measure.unit_of_measure_id = dbo.warehouse_releasing_detail.unit_of_measure_id LEFT OUTER JOIN
                         dbo.material_type RIGHT OUTER JOIN
                         dbo.material LEFT OUTER JOIN
                         dbo.material_brand ON dbo.material.material_brand_id = dbo.material_brand.material_brand_id LEFT OUTER JOIN
                         dbo.material_color_schedule_grade ON dbo.material.material_color_schedule_grade_id = dbo.material_color_schedule_grade.material_color_schedule_grade_id LEFT OUTER JOIN
                         dbo.material_length_weight_rating ON dbo.material.material_length_weight_rating_id = dbo.material_length_weight_rating.material_length_weight_rating_id LEFT OUTER JOIN
                         dbo.material_attribute_size_capacity ON dbo.material.material_attribute_size_capacity_id = dbo.material_attribute_size_capacity.material_attribute_size_capacity_id ON 
                         dbo.material_type.material_type_id = dbo.material.material_type_id LEFT OUTER JOIN
                         dbo.material_item ON dbo.material.material_item_id = dbo.material_item.material_item_id LEFT OUTER JOIN
                         dbo.material_general_category ON dbo.material.material_general_category_id = dbo.material_general_category.material_general_category_id LEFT OUTER JOIN
                         dbo.material_classification ON dbo.material.material_classification_id = dbo.material_classification.material_classification_id ON dbo.warehouse_releasing_detail.material_id = dbo.material.material_id
