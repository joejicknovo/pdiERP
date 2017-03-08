CREATE VIEW dbo.client_v
AS
SELECT        client_id, client_number, customer_name, address, industry_id, dbo.getStatusName(industry_id) AS nature_business_name, client_type_id, dbo.getStatusName(client_type_id) AS type_client_name, is_active, 
                         contact_person, phone_no, email_address, created_by, created_date, updated_by, updated_date
FROM            dbo.client
