CREATE VIEW dbo.transfer_slip_detail_v
AS
SELECT        transfer_slip_detail_id, transfer_slip_id, item_sequence, material_id, dbo.getMaterialDescription(material_id) AS material_description, serial_no, unit_of_measure_id, 
                         dbo.getUnitOfMeasureCode(unit_of_measure_id) AS unit_of_measure_code, quantity, remarks, prepared_by, prepared_date, approved_by, approved_date, received_by, received_date, updated_by, 
                         updated_date
FROM            dbo.transfer_slip_detail
