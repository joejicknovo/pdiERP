CREATE VIEW dbo.return_material_v
AS
SELECT        return_material_id, reference_no, return_material_date, return_material_to_id, dbo.getWarehouseCodeName(return_material_to_id) AS return_to, return_material_from_id, 
                         dbo.getProjectLocation(return_material_from_id) AS return_from, project_id, dbo.getProjectNumber(project_id) AS project_code, attention, status_id, dbo.getStatusName(status_id) AS status_name, other, remarks, 
                         prepared_by, dbo.getEmployeeFullName(prepared_by) AS prepared_by_name, prepared_date, approved_by, dbo.getEmployeeFullName(approved_by) AS approved_by_name, approved_date, received_by, 
                         dbo.getEmployeeFullName(received_by) AS received_by_name, received_date, updated_by, dbo.getEmployeeFullName(updated_by) AS modified_by_name, updated_date AS modified_date
FROM            dbo.return_material
