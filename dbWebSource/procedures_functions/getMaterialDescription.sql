
CREATE FUNCTION [dbo].[getMaterialDescription](
	@id int
) 
RETURNS NVARCHAR(3000) 
AS
BEGIN
	DECLARE @description NVARCHAR(3000); 

	SELECT @description = material_code + ': ' +
						  dbo.getMaterialClassificationName(material_classification_id) + ', ' + 
	                      dbo.getMaterialGeneralCategoryName(material_general_category_id) + ', ' +
						  dbo.getMaterialItemName(material_item_id) + ', ' +
						  dbo.getMaterialTypeName(material_type_id) + ', ' +
						  dbo.getMaterialAttributeSizeCapacityName(material_attribute_size_capacity_id) + ', ' +
						  dbo.getMaterialLengthWeightRatingName(material_length_weight_rating_id) + ', ' +
						  dbo.getMaterialColorScheduleGradeName(material_color_schedule_grade_id) + ', ' +
						  additional_specification + ', ' +
						  dbo.getMaterialBrandName(material_brand_id)
	FROM dbo.material
	WHERE material_id = @id

	RETURN @description;
END;

