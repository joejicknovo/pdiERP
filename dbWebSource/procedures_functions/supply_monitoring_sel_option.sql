
-- ===================================================================================================
-- Author:		Rogelio T. Novo Jr.
-- Create date: October 13, 2016
-- Description:	Supply monitoring
-- ===================================================================================================
-- RNovo	| 02/21/2017	| Change queries from Product to Material. Also change the function of current unit cost.
-- ===================================================================================================
CREATE PROCEDURE [dbo].[supply_monitoring_sel_option] 
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT m.material_id, 
		dbo.getMaterialDescription(m.material_id) AS material_name,
		dbo.getUnitOfMeasureCode(m.unit_of_measure_id) AS unit_of_measure,
		ISNULL(dbo.getMaterialCurrentUnitCost(m.material_id),0) AS latest_price,
		--SUM(wd.quantity) AS available_quantity,
		--dbo.getSumOfDeliveredProduct(m.material_id) AS delivered_quantity,
		ISNULL(ISNULL((SUM(wd.quantity) - dbo.getSumOfDeliveredProduct(m.material_id)),SUM(wd.quantity)),0) AS remaining_quantity
	FROM dbo.warehousing_detail wd
	RIGHT OUTER JOIN dbo.material m ON wd.material_id = m.material_id
	GROUP BY m.material_id, m.unit_of_measure_id
	ORDER BY material_name
	
END

