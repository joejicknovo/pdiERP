
CREATE PROCEDURE [dbo].[contract_review_detail_sel]
(
      @contract_review_id  INT = NULL
	 ,@user_id  int = null
)
AS
BEGIN

SET NOCOUNT ON

	IF @contract_review_id IS NOT NULL  
		SELECT * FROM dbo.contract_review_detail WHERE contract_review_id = @contract_review_id; 

END

