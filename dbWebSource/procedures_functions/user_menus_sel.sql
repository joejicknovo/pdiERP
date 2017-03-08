CREATE  PROCEDURE [dbo].[user_menus_sel]
(
	@user_id  INT = 20
   ,@menu_id  INT = NULL
   ,@pmenu_id INT = NULL
)
AS
BEGIN
	DECLARE @stmt		VARCHAR(4000);
	DECLARE @current_role_id INT = NULL;

	SET @current_role_id = (SELECT dbo.getUserRoleId(@user_id));

	SET @stmt = 'SELECT DISTINCT role_id, is_write, is_delete, menu_id, pmenu_id, menu_name, seq_no, is_default, page_id, page_name, page_title ' +
				'FROM dbo.role_menus_v ';

	IF @current_role_id <> 2 OR @current_role_id IS NULL
		SET @stmt = @stmt + 'WHERE role_id = ' + CAST(@current_role_id AS VARCHAR(20)) + ' ';

	SET @stmt = @stmt +	'UNION ' +
			'SELECT '''' as role_id, '''' as is_write, '''' as is_delete, menu_id, pmenu_id, menu_name, seq_no, is_default, page_id, page_name, page_title ' +
			'FROM default_menus_v ';

 	SET @stmt = @stmt + 'ORDER BY seq_no';

	print @stmt;
	exec(@stmt);
 END;


 


