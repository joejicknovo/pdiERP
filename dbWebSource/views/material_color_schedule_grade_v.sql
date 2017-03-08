CREATE VIEW dbo.material_color_schedule_grade_v
AS
SELECT        material_color_schedule_grade_id, material_length_weight_rating_id, material_color_schedule_grade_code, material_color_schedule_grade_name, is_active, created_by, created_date, updated_by, 
                         updated_date
FROM            dbo.material_color_schedule_grade
