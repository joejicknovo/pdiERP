

create PROCEDURE [dbo].[client_satisfaction_feedback_upd]
(
    @tt    client_satisfaction_feedback_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  document_no						= b.document_no
			,document_date						= b.document_date
			,client_id							= b.client_id
			,project_id							= b.project_id
			,over_all_rating					= b.over_all_rating
			,recommendation_for_improvement		= b.recommendation_for_improvement
            ,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.client_satisfaction_feedback a INNER JOIN @tt b
        ON a.client_satisfaction_feedback_id = b.client_satisfaction_feedback_id 
       WHERE (
				isnull(a.document_no,'')					<> isnull(b.document_no,'')   
			OR	isnull(a.document_date,'')					<> isnull(b.document_date,'')   
			OR	isnull(a.client_id,0)						<> isnull(b.client_id,0)   
			OR	isnull(a.project_id,0)						<> isnull(b.project_id,0)
			OR	isnull(a.over_all_rating,0)					<> isnull(b.over_all_rating,0)
			OR	isnull(a.recommendation_for_improvement,'')	<> isnull(b.recommendation_for_improvement,'')
	   )
	   
-- Insert Process

    INSERT INTO client_satisfaction_feedback (
		 document_no
        ,document_date 
		,client_id
		,project_id
		,over_all_rating
		,recommendation_for_improvement
        ,prepared_by
        ,prepared_date
        )
    SELECT 
		document_no
       ,document_date 
	   ,client_id
	   ,project_id
	   ,over_all_rating
	   ,recommendation_for_improvement
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE client_satisfaction_feedback_id IS NULL;

	RETURN @@IDENTITY
END


