

CREATE PROCEDURE [dbo].[roles_upd]
(
    @tt    roles_tt READONLY
   ,@user_id int
)
AS
SET NOCOUNT ON

BEGIN
	UPDATE a 
		 SET role_id			= b.role_id
	 	    ,role_name			= b.role_name
			,is_export_excel	= b.is_export_excel
	 		,is_export_pdf		= b.is_export_pdf
			,is_import_excel	= b.is_import_excel
	   	    ,updated_by			= @user_id
			,updated_date		= GETDATE()
       FROM dbo.roles a INNER JOIN @tt b
	     ON a.role_id = b.role_id 
	    WHERE (
				isnull(a.role_id,0)				<> isnull(b.role_id,0) 
		     OR isnull(a.role_name,'')			<> isnull(b.role_name,'')
		     OR isnull(a.is_export_excel,'')	<> isnull(b.is_export_excel,'') 
			 OR isnull(a.is_export_pdf,'')		<> isnull(b.is_export_pdf,'') 
			 OR isnull(a.is_import_excel,'')	<> isnull(b.is_import_excel,'') 
			)

-- Insert Process
	INSERT INTO roles (
		 role_id
		,role_name
		,is_export_excel
		,is_export_pdf
		,is_import_excel
		,created_by
		,created_date
    )
	SELECT 
		 role_id
		,role_name
		,is_export_excel
		,is_export_pdf
		,is_import_excel
	    ,@user_id
	    ,GETDATE()
	FROM @tt 
	WHERE role_id IS NULL;

END;



