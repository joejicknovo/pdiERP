CREATE VIEW dbo.return_material_detail_v
AS
SELECT        return_material_detail_id, return_material_id, material_id, dbo.getMaterialDescription(material_id) AS material_description, unit_of_measure_id, dbo.getUnitOfMeasureCode(unit_of_measure_id) 
                         AS unit_of_measure_code, unit_cost, quantity, amount
FROM            dbo.return_material_detail
