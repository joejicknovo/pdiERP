CREATE VIEW dbo.direct_estimate_detail_v
AS
SELECT        dbo.direct_estimate_detail.direct_estimate_detail_id, dbo.direct_estimate_detail.direct_estimate_id, dbo.direct_estimate_detail.item_seq_number, dbo.direct_estimate_detail.item_seq, 
                         dbo.direct_estimate_detail.type_id, dbo.getStatusName(dbo.direct_estimate_detail.type_id) AS type_name, dbo.direct_estimate_detail.description, dbo.direct_estimate_detail.item_id, 
                         dbo.material_v.material_item_full_name, dbo.direct_estimate_detail.is_sample_card, dbo.direct_estimate_detail.qty, dbo.direct_estimate_detail.material, dbo.direct_estimate_detail.material_multiplier, 
                         dbo.direct_estimate_detail.labor, dbo.direct_estimate_detail.labor_multiplier, 
                         dbo.direct_estimate_detail.qty * dbo.direct_estimate_detail.material * dbo.direct_estimate_detail.material_multiplier AS total_cost_material, 
                         dbo.direct_estimate_detail.qty * dbo.direct_estimate_detail.labor * dbo.direct_estimate_detail.labor_multiplier AS total_cost_labor, 
                         dbo.direct_estimate_detail.qty * dbo.direct_estimate_detail.material * dbo.direct_estimate_detail.material_multiplier + dbo.direct_estimate_detail.qty * dbo.direct_estimate_detail.labor * dbo.direct_estimate_detail.labor_multiplier
                          AS total_cost, dbo.material_v.unit_of_measure_name, dbo.direct_estimate_detail.is_active
FROM            dbo.direct_estimate_detail LEFT OUTER JOIN
                         dbo.material_v ON dbo.direct_estimate_detail.item_id = dbo.material_v.material_id
