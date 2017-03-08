

CREATE PROCEDURE [dbo].[client_other_information_sel]
(
    @client_id  INT = NULL
)
AS
BEGIN

SET NOCOUNT ON

  IF @client_id IS NOT NULL  
	 SELECT * 
	 FROM dbo.client_other_information 
	 WHERE client_id = @client_id
	
END


