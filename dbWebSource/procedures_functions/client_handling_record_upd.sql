

create PROCEDURE [dbo].[client_handling_record_upd]
(
    @tt    client_handling_record_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  reference_code		= b.reference_code
			,client_id			= b.client_id
			,project_id			= b.project_id
			,complaint_date		= b.complaint_date
			,complaint_type_id	= b.complaint_type_id
			,complaint			= b.complaint
			,validity_id		= b.validity_id
			,action_taken		= b.action_taken
			,client_feedback	= b.client_feedback
			,date_informed		= b.date_informed
			,[file_name]		= b.[file_name]
            ,updated_by			= @user_id
            ,updated_date		= GETDATE()
     FROM dbo.client_handling_record a INNER JOIN @tt b
        ON a.client_handling_record_id = b.client_handling_record_id 
       WHERE (
				isnull(a.reference_code,'')		<> isnull(b.reference_code,'')   
			OR	isnull(a.client_id,0)			<> isnull(b.client_id,0)   
			OR	isnull(a.project_id,0)			<> isnull(b.project_id,0)   
			OR	isnull(a.complaint_date,'')		<> isnull(b.complaint_date,'')
			OR	isnull(a.complaint_type_id,0)	<> isnull(b.complaint_type_id,0)
			OR	isnull(a.complaint,'')			<> isnull(b.complaint,'')
			OR  isnull(a.validity_id,0)			<> isnull(b.validity_id,0)
			OR	isnull(a.action_taken,'')		<> isnull(b.action_taken,'')
			OR  isnull(a.client_feedback,'')	<> isnull(b.client_feedback,'')
			OR  isnull(a.date_informed,'')		<> isnull(b.date_informed,'')
			OR  isnull(a.[file_name],'')		<> isnull(b.[file_name],'')
	   )
	   
-- Insert Process

    INSERT INTO client_handling_record (
		 reference_code
        ,client_id 
		,project_id
		,complaint_date
		,complaint_type_id
		,complaint
		,validity_id
		,action_taken
		,client_feedback
		,date_informed
		,[file_name]
        ,created_by
        ,created_date
        )
    SELECT 
		 reference_code
        ,client_id 
		,project_id
		,complaint_date
		,complaint_type_id
		,complaint
		,validity_id
		,action_taken
		,client_feedback
		,date_informed
		,[file_name]
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE client_handling_record_id IS NULL;

	RETURN @@IDENTITY
END


