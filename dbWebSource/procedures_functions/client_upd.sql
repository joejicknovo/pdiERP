
CREATE PROCEDURE [dbo].[client_upd]
(
    @tt    client_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  client_number		= b.client_number
			,customer_name		= b.customer_name
			,[address]			= b.[address]
			,industry_id		= b.industry_id
			,client_type_id		= b.client_type_id
			,is_active			= b.is_active
			,contact_person		= b.contact_person
			,phone_no			= b.phone_no
			,email_address		= b.email_address
            ,updated_by			= @user_id
            ,updated_date		= GETDATE()
     FROM dbo.client a INNER JOIN @tt b
        ON a.client_id = b.client_id 
       WHERE (
				isnull(a.client_number,'')		<> isnull(b.client_number,'')   
			OR	isnull(a.customer_name,'')		<> isnull(b.customer_name,'')   
			OR	isnull(a.[address],'')			<> isnull(b.[address],'')   
			OR	isnull(a.industry_id,0)			<> isnull(b.industry_id,0)
			OR	isnull(a.client_type_id,0)		<> isnull(b.client_type_id,0)
			OR	isnull(a.is_active,'')			<> isnull(b.is_active,'')
			OR  isnull(a.contact_person,'')		<> isnull(b.contact_person,'')
			OR	isnull(a.phone_no,'')			<> isnull(b.phone_no,'')
			OR  isnull(a.email_address,'')		<> isnull(b.email_address,'')
	   )
	   
-- Insert Process

    INSERT INTO client (
		client_number
        ,customer_name 
		,[address]
		,industry_id
		,client_type_id
		,is_active
		,contact_person
		,phone_no
		,email_address
        ,created_by
        ,created_date
        )
    SELECT 
		client_number
       ,customer_name 
	   ,[address]
	   ,industry_id
	   ,client_type_id
	   ,is_active
	   ,contact_person
	   ,phone_no
	   ,email_address
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE client_id IS NULL;

	RETURN @@IDENTITY
END

