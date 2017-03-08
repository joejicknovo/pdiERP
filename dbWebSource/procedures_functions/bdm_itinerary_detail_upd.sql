


CREATE PROCEDURE [dbo].[bdm_itinerary_detail_upd]
(
    @tt    bdm_itinerary_detail_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  bdm_itinerary_id	= b.bdm_itinerary_id
			,day_id				= b.day_id
			,[time]				= b.[time]
			,client_id			= b.client_id
			,[address]			= b.[address]
			,contact_person		= b.contact_person
            ,updated_by			= @user_id
            ,updated_date		= GETDATE()
		FROM dbo.bdm_itinerary_detail a INNER JOIN @tt b
        ON a.bdm_itinerary_detail_id = b.bdm_itinerary_detail_id 
   --    WHERE (
			--	isnull(a.bdm_itinerary_id,0)		<> isnull(b.bdm_itinerary_id,0)  
			--OR	isnull(a.day_id,0)					<> isnull(b.day_id,0)  
			--OR	isnull(a.date_time,'')				<> isnull(b.date_time,'') 
			--OR	isnull(a.client_id,0)				<> isnull(b.client_id,0)  
			--OR	isnull(a.[address],'')				<> isnull(b.[address],'')  
			--OR	isnull(a.contact_person,'')			<> isnull(b.contact_person,'')     
	  -- )
	   
-- Insert Process

    INSERT INTO bdm_itinerary_detail (
		 bdm_itinerary_id
        ,day_id
		,[time]
		,client_id
		,[address]
		,contact_person
        ,created_by
        ,created_date
        )
    SELECT 
		 bdm_itinerary_id
        ,day_id
		,[time]
		,client_id
		,[address]
		,contact_person
        ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE bdm_itinerary_detail_id IS NULL;
END



