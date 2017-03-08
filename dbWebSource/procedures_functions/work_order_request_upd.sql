

CREATE PROCEDURE [dbo].[work_order_request_upd]
(
    @tt    work_order_request_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  document_code						= b.document_code
			,revision_no						= b.revision_no
			,effective_date						= b.effective_date
			,work_order_request_date			= b.work_order_request_date
			,work_order_request_to				= b.work_order_request_to
			,department_id						= b.department_id
			,project_id							= b.project_id
			,client_id							= b.client_id
			,type_of_work_id					= b.type_of_work_id
			,others								= b.others
			,description_of_work				= b.description_of_work
			,remarks							= b.remarks
			,status_id							= b.status_id
			,requested_by						= b.requested_by
			,requested_date						= b.requested_date
			,received_by						= b.received_by
			,received_date						= b.received_date
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
		FROM dbo.work_order_request a INNER JOIN @tt b
        ON a.work_order_request_id = b.work_order_request_id 
	   
-- Insert Process

    INSERT INTO work_order_request (
		 document_code
	    ,revision_no
        ,effective_date	
		,work_order_request_date	
		,work_order_request_to	
		,department_id
		,project_id
		,client_id
		,type_of_work_id
		,others
		,description_of_work
		,remarks
		,status_id
		,requested_by
		,requested_date
		,received_by
		,received_date
		,created_by
        ,created_date
        )
    SELECT 
		 document_code
	    ,revision_no
        ,effective_date	
		,work_order_request_date	
		,work_order_request_to	
		,department_id
		,project_id
		,client_id
		,type_of_work_id
		,others
		,description_of_work
		,remarks
		,status_id
		,requested_by
		,requested_date
		,received_by
		,received_date
	    ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE work_order_request_id IS NULL

END


