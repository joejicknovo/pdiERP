

CREATE PROCEDURE [dbo].[transfer_slip_detail_sel]
(
    @transfer_slip_id  INT = NULL
)
AS
BEGIN

SET NOCOUNT ON

  IF @transfer_slip_id IS NOT NULL  
	 SELECT * 
	 FROM dbo.transfer_slip_detail_v 
	 WHERE transfer_slip_id = @transfer_slip_id
	
END

