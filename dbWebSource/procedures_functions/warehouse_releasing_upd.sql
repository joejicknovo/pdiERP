
CREATE PROCEDURE [dbo].[warehouse_releasing_upd]
(
    @tt    warehouse_releasing_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
		SET  warehouse_releasing_no			= b.warehouse_releasing_no
			,warehouse_releasing_date		= b.warehouse_releasing_date
			,po_number						= b.po_number
			,project_id						= b.project_id
			,status_id						= b.status_id
            ,updated_by						= @user_id
            ,updated_date					= GETDATE() 
		FROM dbo.warehouse_releasing a INNER JOIN @tt b
        ON a.warehouse_releasing_id = b.warehouse_releasing_id 

-- Insert Process
    INSERT INTO warehouse_releasing (
         warehouse_releasing_no
		,warehouse_releasing_date
		,po_number
		,project_id
		,status_id
        ,prepared_by
        ,prepared_date
        )
    SELECT 
         warehouse_releasing_no
		,warehouse_releasing_date
		,po_number
		,project_id
		,status_id
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE warehouse_releasing_id IS NULL;

	RETURN @@IDENTITY;
END

