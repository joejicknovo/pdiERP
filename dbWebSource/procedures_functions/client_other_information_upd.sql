

CREATE PROCEDURE [dbo].[client_other_information_upd]
(
    @tt    client_other_information_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  [description]		= b.[description]
			,value				= b.value
            ,updated_by			= @user_id
            ,updated_date		= GETDATE()
     FROM dbo.client_other_information a INNER JOIN @tt b
        ON a.client_other_information_id = b.client_other_information_id 
       WHERE (
				isnull(a.[description],'')	<> isnull(b.[description],'')   
			OR	isnull(a.value,'')			<> isnull(b.value,'')    
	   )
	   
-- Insert Process

    INSERT INTO client_other_information (
		client_id
        ,[description]
		,value
        ,created_by
        ,created_date
        )
    SELECT 
		client_id
       ,[description] 
	   ,value
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE client_other_information_id IS NULL;
END


