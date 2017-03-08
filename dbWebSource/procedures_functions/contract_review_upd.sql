

CREATE PROCEDURE [dbo].[contract_review_upd]
(
    @tt    contract_review_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_review_no					= b.contract_review_no
			,project_id							= b.project_id
			,[subject]							= b.[subject]
			,contract_review_date				= b.contract_review_date
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
		FROM dbo.contract_review a INNER JOIN @tt b
        ON a.contract_review_id = b.contract_review_id 
	   
-- Insert Process

    INSERT INTO contract_review (
		 contract_review_no
	    ,project_id
        ,[subject]	
		,contract_review_date	
		,created_by
        ,created_date
        )
    SELECT 
		 contract_review_no
	    ,project_id
        ,[subject]	
		,contract_review_date	
	    ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE contract_review_id IS NULL

	RETURN @@IDENTITY

END
