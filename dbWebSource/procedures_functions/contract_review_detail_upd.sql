
CREATE PROCEDURE [dbo].[contract_review_detail_upd]
(
    @tt    contract_review_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_review_id		= b.contract_review_id
			,item_no				= b.item_no
			,[document]				= b.[document]
			,[description]			= b.[description]
			,comment				= b.comment
			,recommended_action		= b.recommended_action
			,responsibility			= b.responsibility
            ,updated_by				= @user_id
            ,updated_date			= GETDATE()
     FROM dbo.contract_review_detail a INNER JOIN @tt b
        ON a.contract_review_detail_id = b.contract_review_detail_id 
       WHERE (
				isnull(a.contract_review_id,0)	<> isnull(b.contract_review_id,0)   
			OR	isnull(a.item_no,'')			<> isnull(b.item_no,'')   
			OR	isnull(a.[document],'')			<> isnull(b.[document],'') 
			OR	isnull(a.[description],'')		<> isnull(b.[description],'')
			OR	isnull(a.comment,'')			<> isnull(b.comment,'')
			OR	isnull(a.recommended_action,'')	<> isnull(b.recommended_action,'')
			OR	isnull(a.responsibility,'')		<> isnull(b.responsibility,'')
	   )

-- Insert Process

    INSERT INTO contract_review_detail (
         contract_review_id 
		,item_no	
		,[document]  
		,[description]
		,comment
		,recommended_action
		,responsibility
		,created_by
        ,created_date
        )
    SELECT 
        contract_review_id 
	   ,item_no  
	   ,[document]  
	   ,[description]
	   ,comment
	   ,recommended_action
	   ,responsibility
	   ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE contract_review_detail_id IS NULL;
END

