

CREATE PROCEDURE [dbo].[product_service_performance_upd]
(
    @tt    product_service_performance_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  
			seq_no						= b.seq_no
			,parameter					= b.parameter
			,performance_criteria		= b.performance_criteria
			,is_active					= b.is_active
            ,updated_by					= @user_id
            ,updated_date				= GETDATE()
     FROM dbo.product_service_performance a INNER JOIN @tt b
        ON a.product_service_performance_id = b.product_service_performance_id 
       WHERE (
			isnull(a.seq_no,0)						<> isnull(b.seq_no,0)   
			OR	isnull(a.parameter,'')				<> isnull(b.parameter,'')   
			OR	isnull(a.performance_criteria,'')	<> isnull(b.performance_criteria,'')   
			OR	isnull(a.is_active,'')					<> isnull(b.is_active,'')   
	   )
	   
-- Insert Process

    INSERT INTO product_service_performance (
		seq_no
		,parameter
        ,performance_criteria 
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		seq_no
		,parameter
		,performance_criteria 
		,is_active
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE product_service_performance_id IS NULL;

	RETURN @@IDENTITY
END


