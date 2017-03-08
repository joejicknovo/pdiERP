
CREATE PROCEDURE [dbo].[document_transmittal_detail_upd]
(
    @tt    document_transmittal_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  document_transmittal_id	= b.document_transmittal_id
			,item						= b.item
			,particulars				= b.particulars
			,no_of_copies				= b.no_of_copies
            ,updated_by					= @user_id
            ,updated_date				= GETDATE()
		FROM dbo.document_transmittal_detail a INNER JOIN @tt b
        ON a.document_transmittal_detail_id = b.document_transmittal_detail_id 
       WHERE (
				isnull(a.document_transmittal_id,0)		<> isnull(b.document_transmittal_id,0)  
			OR	isnull(a.item,0)						<> isnull(b.item,0)  
			OR	isnull(a.particulars,'')				<> isnull(b.particulars,'') 
			OR	isnull(a.no_of_copies,0)				<> isnull(b.no_of_copies,0)    
	   )
	   
-- Insert Process

    INSERT INTO document_transmittal_detail (
		 document_transmittal_id
        ,item
		,particulars
		,no_of_copies
        ,prepared_by
        ,prepared_date
        )
    SELECT 
		 document_transmittal_id
        ,item
		,particulars
		,no_of_copies
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE document_transmittal_detail_id IS NULL;
END

