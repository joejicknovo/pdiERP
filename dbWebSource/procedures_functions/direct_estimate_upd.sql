
CREATE PROCEDURE [dbo].[direct_estimate_upd]
(
    @tt    direct_estimate_tt READONLY
   ,@user_id int
)
AS

BEGIN
	-- Update Process
	UPDATE 
		a 
	SET  
		doc_code			= b.doc_code
		,rev_no				= b.rev_no
		,effectivity_date	= b.effectivity_date
		,direct_estimate_no	= b.direct_estimate_no
		,project_id			= b.project_id
		,[subject]			= b.[subject]
		,status_id			= b.status_id
		,is_active			= b.is_active
		,prepared_by		= b.prepared_by
		,prepared_date		= b.prepared_date
		,reviewed_by		= b.reviewed_by
		,reviewed_date		= CASE WHEN b.reviewed_by IS NOT NULL THEN GETDATE() ELSE b.reviewed_date END
		,approved_by		= b.approved_by
		,approved_date		= CASE WHEN b.approved_by IS NOT NULL THEN GETDATE() ELSE b.approved_date END
        ,updated_by			= @user_id
        ,updated_date		= GETDATE()
    FROM dbo.direct_estimate a INNER JOIN @tt b
	ON a.direct_estimate_id = b.direct_estimate_id
	   
	-- Insert Process
    INSERT INTO direct_estimate (
		direct_estimate_no
		,doc_code
        ,project_id
		,rev_no 
		,effectivity_date
		,[subject]
		,status_id
		,is_active
		,prepared_by
		,prepared_date		
		,reviewed_by		
		,reviewed_date		
		,approved_by		
		,approved_date		
        ,created_by
        ,created_date
        )
    SELECT 
		direct_estimate_no
		,doc_code
        ,project_id
		,rev_no 
		,effectivity_date
		,[subject]
		,status_id
		,is_active
		,prepared_by
		,GETDATE()		
		,reviewed_by		
		,reviewed_date		
		,approved_by		
		,approved_date		
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE direct_estimate_id IS NULL;

	RETURN @@IDENTITY
END

