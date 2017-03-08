
create PROCEDURE [dbo].[direct_estimate_sample_card_upd]
(
    @tt    direct_estimate_sample_card_tt READONLY
   ,@user_id int
)
AS

BEGIN
	-- Update Process
	UPDATE a 
	SET  
		scope_of_work_id					= b.scope_of_work_id
		,engineering_sheet_number			= b.engineering_sheet_number
		,item_id							= b.item_id
		,specification						= b.specification
		,brand_id							= b.brand_id
		,updated_by							= @user_id
        ,updated_date						= GETDATE()
	FROM dbo.sample_card a INNER JOIN @tt b
    ON a.sample_card_id = b.sample_card_id 
    
-- Insert Process
	INSERT INTO dbo.sample_card (
		scope_of_work_id			
		,engineering_sheet_number	
		,item_id					
		,specification				
		,brand_id					
		,created_by
        ,created_date
        )
    SELECT 
		 scope_of_work_id			
		,engineering_sheet_number	
		,item_id					
		,specification				
		,brand_id		
	    ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE sample_card_id IS NULL

END

