

CREATE PROCEDURE [dbo].[contract_particular_upd]
(
    @tt    contract_particular_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  project_id							= b.project_id
			,document_code						= b.document_code
			,revision_no						= b.revision_no
			,effective_date						= b.effective_date
			,status_id							= b.status_id
			,prepared_by						= b.prepared_by
			,prepared_date						= b.prepared_date
			,reviewed_by						= b.reviewed_by
			,reviewed_date						= b.reviewed_date
			,approved_by						= b.approved_by
			,approved_date						= b.approved_date
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.contract_particular a INNER JOIN @tt b
        ON a.contract_particular_id = b.contract_particular_id 
       WHERE (
				isnull(a.project_id,0)			<> isnull(b.project_id,0)  
			OR	isnull(a.document_code,'')		<> isnull(b.document_code,'') 
			OR	isnull(a.revision_no,0)			<> isnull(b.revision_no,0)
			OR	isnull(a.effective_date,0)		<> isnull(b.effective_date,0)   
			OR	isnull(a.status_id,0)			<> isnull(b.status_id,0) 
			OR	isnull(a.prepared_by,0)			<> isnull(b.prepared_by,0) 
			OR	isnull(a.prepared_date,'')		<> isnull(b.prepared_date,'') 
			OR	isnull(a.reviewed_by,0)			<> isnull(b.reviewed_by,0) 
			OR	isnull(a.reviewed_date,'')		<> isnull(b.reviewed_date,'') 
			OR	isnull(a.approved_by,0)			<> isnull(b.approved_by,0)   
			OR	isnull(a.approved_date,'')		<> isnull(b.approved_date,'') 
	   )
	   
-- Insert Process

    INSERT INTO contract_particular (
		 project_id
	    ,document_code
        ,revision_no	
		,effective_date	
		,status_id	
		,prepared_by
		,prepared_date
		,reviewed_by
		,reviewed_date
		,approved_by
		,approved_date
        )
    SELECT 
		 project_id
	    ,document_code
        ,revision_no	
		,effective_date	
		,status_id	
		,@user_id
		,GETDATE()
		,reviewed_by
		,reviewed_date
		,approved_by
		,approved_date
    FROM @tt
    WHERE contract_particular_id IS NULL

END


