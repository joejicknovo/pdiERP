
CREATE PROCEDURE [dbo].[document_transmittal_upd]
(
    @tt    document_transmittal_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  document_code				= b.document_code
			,revision_no				= b.revision_no
			,effective_date				= b.effective_date
			,address_to_id				= b.address_to_id
			,department_id				= b.department_id
			,client_id					= b.client_id
			,project_id					= b.project_id
            ,updated_by					= @user_id
            ,updated_date				= GETDATE()
		FROM dbo.document_transmittal a INNER JOIN @tt b
        ON a.document_transmittal_id = b.document_transmittal_id 
		WHERE (
				isnull(a.document_code,'')						<> isnull(b.document_code,'')  
			OR	isnull(a.revision_no,0)							<> isnull(b.revision_no,0)   
			OR	isnull(a.effective_date,0)						<> isnull(b.effective_date,0)   
			OR	isnull(a.address_to_id,0)						<> isnull(b.address_to_id,0)
			OR	isnull(a.department_id,0)						<> isnull(b.department_id,0)
			OR  isnull(a.client_id,0)							<> isnull(b.client_id,0)
			OR	isnull(a.project_id,0)							<> isnull(b.project_id,0)
		)
	   
-- Insert Process

    INSERT INTO document_transmittal (
	     document_transmittal_no
		,document_code
        ,revision_no 
		,effective_date
		,address_to_id
        ,department_id
        ,client_id
		,project_id
		,prepared_by
        ,prepared_date
        )
    SELECT 
	     document_transmittal_no
		,document_code
        ,revision_no 
		,effective_date
		,address_to_id
        ,department_id
        ,client_id
		,project_id
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE document_transmittal_id IS NULL;

	RETURN @@IDENTITY
END



