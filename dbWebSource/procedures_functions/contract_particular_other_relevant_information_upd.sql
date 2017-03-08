

CREATE PROCEDURE [dbo].[contract_particular_other_relevant_information_upd]
(
    @tt    contract_particular_other_relevant_information_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id					= b.contract_particular_id
			,[description]							= b.[description]
			,updated_by								= @user_id
            ,updated_date							= GETDATE()
     FROM dbo.contract_particular_other_relevant_information a INNER JOIN @tt b
        ON a.contract_particular_other_relevant_information_id = b.contract_particular_other_relevant_information_id 
       WHERE (
				isnull(a.contract_particular_id,0)				<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.[description],'')						<> isnull(b.[description],'')
	   )
	   
-- Insert Process

    INSERT INTO contract_particular_other_relevant_information (
		 contract_particular_id
		,[description]
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
		,[description]
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE contract_particular_other_relevant_information_id IS NULL

END


