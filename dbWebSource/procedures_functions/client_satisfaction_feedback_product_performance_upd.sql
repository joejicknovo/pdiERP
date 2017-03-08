

CREATE PROCEDURE [dbo].[client_satisfaction_feedback_product_performance_upd]
(
    @tt    client_satisfaction_feedback_product_performance_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET 
			product_service_performance_id		= b.product_service_performance_id
			,status_id							= b.status_id
            ,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.client_satisfaction_feedback_product_performance a INNER JOIN @tt b
        ON a.client_satisfaction_feedback_product_performance_id = b.client_satisfaction_feedback_product_performance_id 
       WHERE (
			isnull(a.product_service_performance_id,0)	<> isnull(b.product_service_performance_id,0)   
			OR	isnull(a.status_id,0)					<> isnull(b.status_id,0)   
	   )
	   
-- Insert Process
    INSERT INTO client_satisfaction_feedback_product_performance (
		 client_satisfaction_feedback_id
        ,product_service_performance_id 
		,status_id
		,created_by
		,created_date
        )
    SELECT 
		client_satisfaction_feedback_id
       ,product_service_performance_id 
	   ,status_id
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE client_satisfaction_feedback_product_performance_id IS NULL;
END


