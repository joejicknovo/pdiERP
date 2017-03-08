CREATE VIEW dbo.personnel_required_v
AS
SELECT        personnel_required_id, prospective_project_evaluation_id, project_manager_id, dbo.getProjectManagerName(project_manager_id) AS project_manager, project_engineer_id, 
                         dbo.getProjectEngineerName(project_engineer_id) AS project_engineer, safety_engineer_id, dbo.getSafetyEngineerName(safety_engineer_id) AS safety_engineer, material_engineer_id, 
                         dbo.getMaterialEngineerName(material_engineer_id) AS material_engineer, others, created_by, created_date, updated_by, updated_date
FROM            dbo.personnel_required
