
CREATE PROCEDURE [dbo].[direct_estimate_detail_upd]
(
    @tt    direct_estimate_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
	-- Update Process
	UPDATE 
		a 
	SET  
		direct_estimate_id		= b.direct_estimate_id
		,item_seq_number		= b.item_seq_number
		,item_seq				= b.item_seq
		,[type_id]				= b.[type_id]
		,[description]			= b.[description]
		,item_id				= b.item_id
		,is_sample_card			= b.is_sample_card
		,qty					= b. qty
		,material				= b.material
		,material_multiplier	= b.material_multiplier
		,labor					= b.labor
		,labor_multiplier		= b.labor_multiplier
		,is_active				= b.is_active
    FROM dbo.direct_estimate_detail a INNER JOIN @tt b
	ON a.direct_estimate_detail_id = b.direct_estimate_detail_id
	   
	-- Insert Process
    INSERT INTO direct_estimate_detail (
		direct_estimate_id
        ,item_seq_number 
		,item_seq
		,[type_id]
		,[description]
		,item_id
		,is_sample_card
		,qty
		,material
		,material_multiplier
		,labor
		,labor_multiplier
		,is_active
        )
    SELECT 
		direct_estimate_id
        ,item_seq_number 
		,item_seq
		,[type_id]
		,[description]
		,item_id
		,is_sample_card
		,qty
		,material
		,material_multiplier
		,labor
		,labor_multiplier
		,is_active
    FROM @tt
    WHERE direct_estimate_detail_id IS NULL;

	RETURN @@IDENTITY
END

