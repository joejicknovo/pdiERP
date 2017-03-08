
CREATE PROCEDURE [dbo].[purchase_order_sel]
(
	@user_id int = NULL,
    @purchase_order_id  INT = NULL,
	@search_param NVARCHAR(1000) = NULL,
	@pno INT = 1,
	@rpp INT = 20 -- number of rows per page
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);
	DECLARE @count INT = 0;
	DECLARE @page_count INT = 1;

	SET @sql = 'SELECT * FROM dbo.purchase_order_v WHERE 1 = 1 ';
	SELECT @count = COUNT(*) FROM dbo.purchase_order_v; 

	IF @search_param IS NOT NULL  
	BEGIN
		SET @sql = @sql + ' AND UPPER(purchase_order_number) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(issued_date) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(to) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(ship_to) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(supplier_delivery_date) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(term) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @sql = @sql + ' OR UPPER(po_status) LIKE UPPER(''%' + @search_param + '%'') ';
		SET @count = 1;
	END
	ELSE
	BEGIN
		IF @purchase_order_id IS NOT NULL  
		BEGIN
			SET @sql = @sql + ' AND purchase_order_id =  ' + CAST(@purchase_order_id AS NVARCHAR(10)) + ' ';
			SET @count = 1;
		END
	END
	
	SET @sql = @sql + ' ORDER BY purchase_order_number';
	SET @sql = @sql + ' OFFSET (' + CAST(@pno-1 AS VARCHAR(20)) +')*' + CAST(@rpp AS VARCHAR(20)) + ' ROWS FETCH NEXT ' + CAST(@rpp AS VARCHAR(20)) + ' ROWS ONLY '; 
	EXEC(@sql);		

	SET @page_count =  CEILING((CONVERT(DECIMAL(20,5), @count)) / @rpp);
	print @page_count;
	RETURN @page_count;
END
