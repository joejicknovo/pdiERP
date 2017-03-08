
create PROCEDURE [dbo].[materials_requisition_slip_upd]
(
    @tt    materials_requisition_slip_tt READONLY
   ,@user_id int
)
AS

BEGIN
	-- Update Process
	UPDATE 
		a 
	SET  
		doc_code						= b.doc_code
		,rev_no							= b.rev_no
		,effectivity_date				= b.effectivity_date
		,mrs_no							= b.mrs_no
		,mrs_date						= b.mrs_date
		,project_id						= b.project_id
		,needed_date					= b.needed_date
		,dr_no							= b.dr_no
		,po_no							= b.po_no
		,status_id						= b.status_id
		,is_active						= b.is_active
		,requested_by					= b.requested_by
		,requested_date					= b.requested_date
		,noted_by						= b.noted_by
		,noted_date						= CASE WHEN b.noted_by IS NOT NULL THEN GETDATE() ELSE b.noted_date END
		,checked_by						= b.checked_by
		,checked_date					= CASE WHEN b.checked_by IS NOT NULL THEN GETDATE() ELSE b.checked_date END
		,approved_by					= b.approved_by
		,approved_date					= CASE WHEN b.approved_by IS NOT NULL THEN GETDATE() ELSE b.approved_date END
        ,updated_by						= @user_id
        ,updated_date					= GETDATE()
    FROM dbo.materials_requisition_slip a INNER JOIN @tt b
	ON a.materials_requisition_slip_id = b.materials_requisition_slip_id
	   
	-- Insert Process
    INSERT INTO materials_requisition_slip (
		doc_code
		,rev_no 
		,effectivity_date
		,mrs_no
		,mrs_date
		,project_id
		,needed_date
		,dr_no
		,po_no
		,status_id
		,is_active
		,requested_by
		,requested_date		
		,noted_by		
		,noted_date		
		,checked_by		
		,checked_date		
		,approved_by		
		,approved_date		
        ,created_by
        ,created_date
        )
    SELECT 
		doc_code
		,rev_no 
		,effectivity_date
		,mrs_no
		,mrs_date
		,project_id
		,needed_date
		,dr_no
		,po_no
		,status_id
		,is_active
		,requested_by
		,GETDATE()		
		,noted_by		
		,noted_date		
		,checked_by		
		,checked_date		
		,approved_by		
		,approved_date		
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE materials_requisition_slip_id IS NULL;

	RETURN @@IDENTITY
END

