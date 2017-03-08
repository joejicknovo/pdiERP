

CREATE PROCEDURE [dbo].[warehouse_releasing_detail_sel]
(
    @warehouse_releasing_id  INT = NULL
)
AS
BEGIN

SET NOCOUNT ON

  IF @warehouse_releasing_id IS NOT NULL  
	 SELECT * 
	 FROM dbo.warehouse_releasing_detail_v 
	 WHERE warehouse_releasing_id = @warehouse_releasing_id
	
END


