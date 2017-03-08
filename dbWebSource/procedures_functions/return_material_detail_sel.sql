
CREATE PROCEDURE [dbo].[return_material_detail_sel]
(
    @return_material_id  INT = NULL
)
AS
BEGIN

SET NOCOUNT ON

  IF @return_material_id IS NOT NULL  
	 SELECT * 
	 FROM dbo.return_material_detail_v 
	 WHERE return_material_id = @return_material_id
	
END



