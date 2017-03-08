

CREATE PROCEDURE [dbo].[bdm_itinerary_upd]
(
    @tt    bdm_itinerary_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  document_code		= b.document_code
			,revision_no		= b.revision_no
			,effective_date		= b.effective_date
			,status_id			= b.status_id
            ,updated_by			= @user_id
            ,updated_date		= GETDATE()
		FROM dbo.bdm_itinerary a INNER JOIN @tt b
        ON a.bdm_itinerary_id = b.bdm_itinerary_id 
	   
-- Insert Process

    INSERT INTO bdm_itinerary (
		 bdm_itinerary_no
		,document_code
        ,revision_no 
		,effective_date
		,status_id
        ,prepared_by
        ,prepared_date
        )
    SELECT 
	     bdm_itinerary_no
		,document_code
		,revision_no 
		,effective_date
		,status_id
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE bdm_itinerary_id IS NULL;

	RETURN @@IDENTITY
END


