

CREATE PROCEDURE [dbo].[contract_documentation_upd]
(
    @tt    contract_documentation_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id					= b.contract_particular_id
			,notice_of_intent						= b.notice_of_intent
			,letter_of_acceptance					= b.letter_of_acceptance
			,contract_agreement						= b.contract_agreement
			,updated_by								= @user_id
            ,updated_date							= GETDATE()
     FROM dbo.contract_documentation a INNER JOIN @tt b
        ON a.contract_documentation_id = b.contract_documentation_id 
       WHERE (
				isnull(a.contract_particular_id,0)				<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.notice_of_intent,'')					<> isnull(b.notice_of_intent,'')
			OR	isnull(a.letter_of_acceptance,'')				<> isnull(b.letter_of_acceptance,'')
			OR	isnull(a.contract_agreement,'')					<> isnull(b.contract_agreement,'')
	   )
	   
-- Insert Process

    INSERT INTO contract_documentation (
		 contract_particular_id
		,notice_of_intent	
		,letter_of_acceptance
		,contract_agreement
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
		,notice_of_intent	
		,letter_of_acceptance
		,contract_agreement
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE contract_documentation_id IS NULL

END


