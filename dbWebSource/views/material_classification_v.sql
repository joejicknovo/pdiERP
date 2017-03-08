CREATE VIEW dbo.material_classification_v
AS
SELECT        material_classification_id, material_classification_code, material_classification_name, is_active, dbo.countMaterialGeneralCategory(material_classification_id) AS countMaterialGeneralCategory, created_by, 
                         created_date, updated_by, updated_date
FROM            dbo.material_classification
