

CREATE PROCEDURE [dbo].[bdm_client_call_upd]
(
    @tt    bdm_client_call_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  bdm_client_call_no		= b.bdm_client_call_no
			,document_code			= b.document_code
			,revision_no			= b.revision_no
			,effective_date			= b.effective_date
			,date_visit				= b.date_visit
			,client_id				= b.client_id
			,detail_visit			= b.detail_visit
			,next_action			= b.next_action
			,remarks				= b.remarks
            ,updated_by				= @user_id
            ,updated_date			= GETDATE()
     FROM dbo.bdm_client_call a INNER JOIN @tt b
        ON a.bdm_client_call_id = b.bdm_client_call_id 
       WHERE (
				isnull(a.bdm_client_call_no,'')		<> isnull(b.bdm_client_call_no,'')   
			OR	isnull(a.document_code,'')			<> isnull(b.document_code,'')   
			OR	isnull(a.revision_no,0)				<> isnull(b.revision_no,0)   
			OR	isnull(a.effective_date,'')			<> isnull(b.effective_date,'')
			OR	isnull(a.date_visit,'')				<> isnull(b.date_visit,'')
			OR	isnull(a.client_id,0)				<> isnull(b.client_id,0)
			OR  isnull(a.detail_visit,'')			<> isnull(b.detail_visit,'')
			OR	isnull(a.next_action,'')			<> isnull(b.next_action,'')
			OR  isnull(a.remarks,'')				<> isnull(b.remarks,'')
	   )
	   
-- Insert Process

    INSERT INTO bdm_client_call (
		bdm_client_call_no
        ,document_code 
		,revision_no
		,effective_date
		,date_visit
		,client_id
		,detail_visit
		,next_action
		,remarks
        ,prepared_by
        ,prepared_date
        )
    SELECT 
		bdm_client_call_no
       ,document_code 
	   ,revision_no
	   ,effective_date
	   ,date_visit
	   ,client_id
	   ,detail_visit
	   ,next_action
	   ,remarks
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE bdm_client_call_id IS NULL;

	RETURN @@IDENTITY
END


