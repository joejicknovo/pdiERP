

CREATE PROCEDURE [dbo].[contract_particular_programme_upd]
(
    @tt    contract_particular_programme_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id					= b.contract_particular_id
			,programme_id							= b.programme_id
			,commencement_date						= b.commencement_date
			,contractual_completion_date			= b.contractual_completion_date
			,updated_by								= @user_id
            ,updated_date							= GETDATE()
     FROM dbo.contract_particular_programme a INNER JOIN @tt b
        ON a.contract_particular_programme_id = b.contract_particular_programme_id 
       WHERE (
				isnull(a.contract_particular_id,0)						<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.programme_id,0)								<> isnull(b.programme_id,0) 
			OR	isnull(a.commencement_date,'')							<> isnull(b.commencement_date,'')
			OR	isnull(a.contractual_completion_date,'')				<> isnull(b.contractual_completion_date,'')
	   )
	   
-- Insert Process

    INSERT INTO contract_particular_programme (
		 contract_particular_id
	    ,programme_id
        ,commencement_date	
		,contractual_completion_date	
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
	    ,programme_id
        ,commencement_date	
		,contractual_completion_date	
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE contract_particular_programme_id IS NULL

END


