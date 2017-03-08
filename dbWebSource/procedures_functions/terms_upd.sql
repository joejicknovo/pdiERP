

create PROCEDURE [dbo].[terms_upd]
(
    @tt    terms_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
    SET  
		term						= b.term
		,is_active					= b.is_active
        ,updated_by					= @user_id
        ,updated_date				= GETDATE()
    FROM dbo.terms a INNER JOIN @tt b
	ON a.term_id = b.term_id 
	   
-- Insert Process

    INSERT INTO terms (
		term
		,is_active
        ,created_by
        ,created_date
        )
    SELECT 
		term
		,is_active
		,@user_id
		,GETDATE()
    FROM @tt
    WHERE term_id IS NULL;

	RETURN @@IDENTITY
END


