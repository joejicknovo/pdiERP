

CREATE PROCEDURE [dbo].[lead_upd]
(
    @tt    lead_tt READONLY
   ,@user_id int
)
AS

BEGIN
-- Update Process
    UPDATE a 
        SET  lead_no						= b.lead_no
			,lead_classification_id			= b.lead_classification_id
			,assigned_sales_associate_id	= b.assigned_sales_associate_id
			,client_id						= b.client_id
			,site_location					= b.site_location
			,lead_type_id					= b.lead_type_id
			,source_id						= b.source_id
			,lead_source_id					= b.lead_source_id
			,visit_date						= b.visit_date
			,remarks						= b.remarks
			,status_id						= b.status_id
            ,updated_by						= @user_id
            ,updated_date					= GETDATE()
     FROM dbo.lead a INNER JOIN @tt b
        ON a.lead_id = b.lead_id 
       WHERE (
				isnull(a.lead_no,'')					<> isnull(b.lead_no,'')   
			OR	isnull(a.lead_classification_id,0)		<> isnull(b.lead_classification_id,0)   
			OR	isnull(a.assigned_sales_associate_id,0)	<> isnull(b.assigned_sales_associate_id,0)
			OR	isnull(a.client_id,0)					<> isnull(b.client_id,0)
			OR  isnull(a.site_location,'')				<> isnull(b.site_location,'')
			OR	isnull(a.lead_type_id,0)				<> isnull(b.lead_type_id,0)
			OR  isnull(a.source_id,0)					<> isnull(b.source_id,0)
			OR	isnull(a.lead_source_id,0)				<> isnull(b.lead_source_id,0) 
			OR	isnull(a.visit_date,'')					<> isnull(b.visit_date,'')   
			OR	isnull(a.remarks,'')					<> isnull(b.remarks,'') 
			OR	isnull(a.status_id,0)					<> isnull(b.status_id,0)
	   )
	   
-- Insert Process

    INSERT INTO lead (
         lead_no 
		,lead_classification_id
		,assigned_sales_associate_id
		,client_id
		,site_location
		,lead_type_id
		,source_id
		,lead_source_id
		,visit_date
		,remarks
		,status_id
        ,created_by
        ,created_date
        )
    SELECT 
        --'L' + CONVERT(VARCHAR(19),YEAR(GETDATE())) + REPLICATE('0',3-LEN(RTRIM(@@IDENTITY))) + RTRIM(@@IDENTITY) 
		lead_no
	   ,lead_classification_id
	   ,assigned_sales_associate_id
	   ,client_id
	   ,site_location
	   ,lead_type_id
	   ,source_id
	   ,lead_source_id
	   ,visit_date
	   ,remarks
	   ,status_id
       ,@user_id
       ,GETDATE()
    FROM @tt
    WHERE lead_id IS NULL;

	RETURN @@IDENTITY;
END