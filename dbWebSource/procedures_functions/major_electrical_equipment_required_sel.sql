


CREATE PROCEDURE [dbo].[major_electrical_equipment_required_sel]
(
   @major_electrical_equipment_required_id INT= NULL,
   @prospective_project_evaluation_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.major_electrical_equipment_required WHERE 1=1';

	IF @major_electrical_equipment_required_id IS NOT NULL
		SET @stmt = @stmt + ' AND major_electrical_equipment_required_id='+ CAST((@major_electrical_equipment_required_id) AS VARCHAR(MAX));

	IF @prospective_project_evaluation_id IS NOT NULL
		SET @stmt = @stmt + ' AND prospective_project_evaluation_id='+ CAST((@prospective_project_evaluation_id) AS VARCHAR(MAX));
	
	PRINT (@stmt);
	EXEC (@stmt);
END



