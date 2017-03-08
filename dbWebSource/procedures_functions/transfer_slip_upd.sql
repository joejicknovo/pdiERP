

CREATE PROCEDURE [dbo].[transfer_slip_upd]
(
    @tt    transfer_slip_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
		SET  transfer_slip_no				= b.transfer_slip_no
			,transfer_slip_date				= b.transfer_slip_date
			,transfer_from					= b.transfer_from
			,transfer_to					= b.transfer_to
			,status_id						= b.status_id
			,document_code  				= b.document_code
			,revision_no  					= b.revision_no
			,effective_date					= b.effective_date
            ,updated_by						= @user_id
            ,updated_date					= GETDATE() 
		FROM dbo.transfer_slip a INNER JOIN @tt b
        ON a.transfer_slip_id = b.transfer_slip_id 

-- Insert Process
    INSERT INTO transfer_slip (
         transfer_slip_no	
		,transfer_slip_date	
		,transfer_from		
		,transfer_to		
		,status_id			
		,document_code  	
		,revision_no  		
		,effective_date		
        ,prepared_by
        ,prepared_date
        )
    SELECT 
         transfer_slip_no	
		,transfer_slip_date	
		,transfer_from		
		,transfer_to		
		,status_id			
		,document_code  	
		,revision_no  		
		,effective_date	
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE transfer_slip_id IS NULL;

	RETURN @@IDENTITY;
END



