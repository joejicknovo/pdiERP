

CREATE PROCEDURE [dbo].[operation_issue_register_detail_upd]
(
    @tt    operation_issue_register_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
	-- Update Process
	UPDATE 
		a 
	SET  
		 operation_issue_register_id		= b.operation_issue_register_id
		,item_sequence						= b.item_sequence
		,project_id							= b.project_id
		,reference_war_correspondence		= b.reference_war_correspondence
		,related_internal_external_issue	= b.related_internal_external_issue
		,[action]							= b.[action]
		,related_document				    = b.related_document
		,responsibility						= b.responsibility
		,planned_date						= b.planned_date
		,actual_completion_date				= b.actual_completion_date
		,status_id						    = b.status_id
		,date_closed						= b.date_closed
		,remarks							= b.remarks
		,updated_by							= @user_id
		,updated_date						= GETDATE()
    FROM dbo.operation_issue_register_detail a INNER JOIN @tt b
	ON a.operation_issue_register_detail_id = b.operation_issue_register_detail_id
	   
	-- Insert Process
    INSERT INTO operation_issue_register_detail (
		 operation_issue_register_id
        ,item_sequence 
		,project_id
		,reference_war_correspondence
		,related_internal_external_issue
		,[action]
		,related_document
		,responsibility
		,planned_date
		,actual_completion_date
		,status_id
		,date_closed
		,remarks
		,prepared_by
		,prepared_date
        )
    SELECT 
		 operation_issue_register_id
        ,item_sequence 
		,project_id
		,reference_war_correspondence
		,related_internal_external_issue
		,[action]
		,related_document
		,responsibility
		,planned_date
		,actual_completion_date
		,status_id
		,date_closed
		,remarks
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE operation_issue_register_detail_id IS NULL;

	RETURN @@IDENTITY
END


