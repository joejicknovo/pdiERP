
CREATE PROCEDURE [dbo].[bid_upd]
(
    @tt    bid_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  bid_code							= b.bid_code
			,direct_cost						= b.direct_cost
			,bid_date							= b.bid_date
			,extended_cost						= b.extended_cost
			,bid_type_id						= b.bid_type_id
			,selling_cost						= b.selling_cost
			,submission_date					= b.submission_date
			,project_id							= b.project_id
			,project_type_id					= b.project_type_id
			,duration							= b.duration
			,client_id							= b.client_id
			,prebid_datetime_conference			= b.prebid_datetime_conference
			,prebid_venue_conference			= b.prebid_venue_conference
			,site_datetime_inspection			= b.site_datetime_inspection
			,site_venue_inspection				= b.site_venue_inspection
			,submission_courier					= b.submission_courier
			,submission_email					= b.submission_email
			,submission_hardcopy				= b.submission_hardcopy
			,validity_of_bid					= b.validity_of_bid
			,bid_document_amount				= b.bid_document_amount
			,remark								= b.remark
			,status_id							= b.status_id
			,updated_by							= @user_id
            ,updated_date						= GETDATE()
     FROM dbo.bid a INNER JOIN @tt b
        ON a.bid_id = b.bid_id 
       WHERE (
				isnull(a.bid_code,'')						<> isnull(b.bid_code,'')  
			OR	isnull(a.direct_cost,0)						<> isnull(b.direct_cost,0) 
			OR	isnull(a.bid_date,'')						<> isnull(b.bid_date,'') 
			OR	isnull(a.extended_cost,0)					<> isnull(b.extended_cost,0) 
			OR	isnull(a.bid_type_id,0)						<> isnull(b.bid_type_id,0) 
			OR	isnull(a.selling_cost,0)					<> isnull(b.selling_cost,0) 
			OR	isnull(a.submission_date,'')				<> isnull(b.submission_date,'')   
			OR	isnull(a.project_id,0)						<> isnull(b.project_id,0) 
			OR	isnull(a.project_type_id,0)					<> isnull(b.project_type_id,0) 
			OR	isnull(a.duration,0)						<> isnull(b.duration,0) 
			OR	isnull(a.client_id,0)						<> isnull(b.client_id,0) 
			OR	isnull(a.prebid_datetime_conference,'')		<> isnull(b.prebid_datetime_conference,'') 
			OR	isnull(a.prebid_venue_conference,'')		<> isnull(b.prebid_venue_conference,'') 
			OR	isnull(a.site_datetime_inspection,'')		<> isnull(b.site_datetime_inspection,'') 
			OR	isnull(a.site_venue_inspection,'')			<> isnull(b.site_venue_inspection,'')
			OR	isnull(a.submission_courier,'')				<> isnull(b.submission_courier,'') 
			OR	isnull(a.submission_email,'')				<> isnull(b.submission_email,'')
			OR	isnull(a.submission_hardcopy,'')			<> isnull(b.submission_hardcopy,'')
			OR	isnull(a.validity_of_bid,'')				<> isnull(b.validity_of_bid,'')
			OR	isnull(a.bid_document_amount,0)				<> isnull(b.bid_document_amount,0) 
			OR	isnull(a.remark,'')							<> isnull(b.remark,'') 
			OR	isnull(a.status_id,0)						<> isnull(b.status_id,0) 
	   )
	   
-- Insert Process

    INSERT INTO bid (
		 bid_code
		,direct_cost
		,bid_date
		,extended_cost
		,bid_type_id
		,selling_cost
		,submission_date
		,project_id
		,project_type_id
		,duration
		,client_id
		,prebid_datetime_conference
		,prebid_venue_conference
		,site_datetime_inspection
		,site_venue_inspection
		,submission_courier
		,submission_email
		,submission_hardcopy
		,validity_of_bid
		,bid_document_amount
		,remark
		,status_id
		,prepared_by
        ,prepared_date
        )
    SELECT 
		 bid_code
		,direct_cost
		,bid_date
		,extended_cost
		,bid_type_id
		,selling_cost
		,submission_date
		,project_id
		,project_type_id
		,duration
		,client_id
		,prebid_datetime_conference
		,prebid_venue_conference
		,site_datetime_inspection
		,site_venue_inspection
		,submission_courier
		,submission_email
		,submission_hardcopy
		,validity_of_bid
		,bid_document_amount
		,remark
		,status_id
	    ,@user_id
        ,GETDATE()
    FROM @tt
    WHERE bid_id IS NULL

END

