


CREATE PROCEDURE [dbo].[employee_sel]
(
    @employee_id  INT = null
)
AS
BEGIN

SET NOCOUNT ON

  IF @employee_id IS NOT NULL  
	 SELECT * FROM dbo.employee_v WHERE @employee_id = @employee_id; 
  ELSE
     SELECT * FROM dbo.employee_v ORDER BY employee_last_name; 
	
END
 







