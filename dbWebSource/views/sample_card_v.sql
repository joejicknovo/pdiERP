CREATE VIEW dbo.sample_card_v
AS
SELECT        dbo.sample_card.sample_card_id, dbo.sample_card.scope_of_work_id, dbo.getStatusName(dbo.sample_card.scope_of_work_id) AS scope_of_work_name, dbo.sample_card.engineering_sheet_number, 
                         dbo.sample_card.item_id, dbo.material_v.material_item_full_name, dbo.sample_card.specification, dbo.sample_card.brand_id, dbo.material_brand.material_brand_name, dbo.sample_card.created_by, 
                         dbo.getEmployeeFullName(dbo.sample_card.created_by) AS created_by_name, dbo.sample_card.created_date, dbo.sample_card.updated_by, dbo.getEmployeeFullName(dbo.sample_card.updated_by) 
                         AS updated_by_name, dbo.sample_card.updated_date
FROM            dbo.sample_card INNER JOIN
                         dbo.material_v ON dbo.sample_card.item_id = dbo.material_v.material_id INNER JOIN
                         dbo.material_brand ON dbo.sample_card.brand_id = dbo.material_brand.material_brand_id
