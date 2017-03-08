

create PROCEDURE [dbo].[employee_users_upd]
(
   @tt	employee_users_tt READONLY
   , @user_id INT
)
AS
BEGIN
	SET NOCOUNT ON;

	-- Update Process
	UPDATE a 
	SET logon			= b.logon 
		,[password]		= b.[password]
		,role_id		= b.role_id
		,updated_by		= @user_id
		,updated_date	= GETDATE()
	FROM dbo.users a INNER JOIN @tt b
	ON a.[user_id] = b.[user_id] 
	WHERE 
		(
			ISNULL(a.logon,'')  <> ISNULL(b.logon,'')   
			OR ISNULL(a.[password], '') <> ISNULL(b.[password], '')
			OR ISNULL(a.role_id,0) <> ISNULL(b.role_id,0)
		)
END
