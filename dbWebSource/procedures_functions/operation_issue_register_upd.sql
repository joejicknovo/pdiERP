

CREATE PROCEDURE [dbo].[operation_issue_register_upd]
(
    @tt    operation_issue_register_tt READONLY
   ,@user_id int
)
AS

BEGIN
	-- Update Process
	UPDATE 
		a 
	SET  
		 reference_no					= b.reference_no
		,last_review_date				= b.last_review_date
		,status_id						= b.status_id
		,document_code					= b.document_code
		,revision_no					= b.revision_no
		,effective_date				    = b.effective_date
        ,updated_by						= @user_id
        ,updated_date					= GETDATE()
    FROM dbo.operation_issue_register a INNER JOIN @tt b
	ON a.operation_issue_register_id = b.operation_issue_register_id
	   
	-- Insert Process
    INSERT INTO operation_issue_register (
		 reference_no	
		,last_review_date
		,status_id		
		,document_code		
		,revision_no			
		,effective_date
		,prepared_by					
		,prepared_date					
        )
    SELECT 
		 reference_no	
		,last_review_date
		,status_id		
		,document_code		
		,revision_no			
		,effective_date	
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE operation_issue_register_id IS NULL;

	RETURN @@IDENTITY
END


