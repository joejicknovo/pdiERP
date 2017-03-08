CREATE PROCEDURE [dbo].[users_change_pwd_upd]
(
    @user_id INT
   ,@password NVARCHAR(200)
)

AS
SET NOCOUNT ON
UPDATE dbo.users SET password=@password WHERE user_id=@user_id

