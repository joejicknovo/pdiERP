

CREATE PROCEDURE [dbo].[contract_particular_financial_upd]
(
    @tt    contract_particular_financial_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  contract_particular_id					= b.contract_particular_id
			,contract_sum							= b.contract_sum
			,budgeted_cost							= b.budgeted_cost
			,budgeted_oh_profit_amount				= b.budgeted_oh_profit_amount
			,budgeted_oh_profit_percent_cost		= b.budgeted_oh_profit_percent_cost
			,budgeted_oh_profit_percent_turnover	= b.budgeted_oh_profit_percent_turnover
			,updated_by								= @user_id
            ,updated_date							= GETDATE()
     FROM dbo.contract_particular_financial a INNER JOIN @tt b
        ON a.contract_particular_financial_id = b.contract_particular_financial_id 
       WHERE (
				isnull(a.contract_particular_id,0)				<> isnull(b.contract_particular_id,0)  
			OR	isnull(a.contract_sum,0)						<> isnull(b.contract_sum,0)
			OR	isnull(a.budgeted_cost,0)						<> isnull(b.budgeted_cost,0)
			OR	isnull(a.budgeted_oh_profit_amount,0)			<> isnull(b.budgeted_oh_profit_amount,0)
			OR	isnull(a.budgeted_oh_profit_percent_cost,0)		<> isnull(b.budgeted_oh_profit_percent_cost,0)
			OR	isnull(a.budgeted_oh_profit_percent_turnover,0)	<> isnull(b.budgeted_oh_profit_percent_turnover,0)
	   )
	   
-- Insert Process

    INSERT INTO contract_particular_financial (
		 contract_particular_id
		,contract_sum	
		,budgeted_cost
		,budgeted_oh_profit_amount
		,budgeted_oh_profit_percent_cost
		,budgeted_oh_profit_percent_turnover
		,created_by
		,created_date
        )
    SELECT 
		 contract_particular_id
		,contract_sum	
		,budgeted_cost
		,budgeted_oh_profit_amount
		,budgeted_oh_profit_percent_cost
		,budgeted_oh_profit_percent_turnover
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE contract_particular_financial_id IS NULL

END


