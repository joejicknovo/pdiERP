CREATE VIEW dbo.lead_personnel_required_v
AS
SELECT        dbo.prospective_project_evaluation.lead_id, dbo.personnel_required.personnel_required_id, dbo.personnel_required.prospective_project_evaluation_id, dbo.personnel_required.project_manager_id, 
                         dbo.personnel_required.project_engineer_id, dbo.personnel_required.safety_engineer_id, dbo.personnel_required.material_engineer_id, dbo.personnel_required.others
FROM            dbo.personnel_required LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.personnel_required.prospective_project_evaluation_id = dbo.prospective_project_evaluation.prospective_project_evaluation_id
