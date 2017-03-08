CREATE VIEW dbo.lead_major_electrical_equipment_required_v
AS
SELECT        dbo.prospective_project_evaluation.lead_id, dbo.major_electrical_equipment_required.major_electrical_equipment_required_id, dbo.major_electrical_equipment_required.prospective_project_evaluation_id, 
                         dbo.major_electrical_equipment_required.equipment
FROM            dbo.major_electrical_equipment_required LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.major_electrical_equipment_required.prospective_project_evaluation_id = dbo.prospective_project_evaluation.prospective_project_evaluation_id
