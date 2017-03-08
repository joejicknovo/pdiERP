


CREATE PROCEDURE [dbo].[product_sel]
(
    @product_id  INT = null
)
AS
BEGIN

SET NOCOUNT ON

BEGIN
	DECLARE @stmt		VARCHAR(4000);

	SET @stmt = 'SELECT * FROM dbo.product';

	IF @product_id IS NOT NULL
		SET @stmt = @stmt + ' WHERE product_id='+ @product_id;
	
	EXEC (@stmt);
END

  --IF @product_id IS NOT NULL  
	 --SELECT * FROM dbo.product_v WHERE product_id = @product_id; 
  --ELSE
  --   SELECT * FROM dbo.product_v
	 --ORDER BY product_name; 
	
END
 







