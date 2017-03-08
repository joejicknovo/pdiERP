CREATE VIEW dbo.users_v
AS
SELECT        user_id, logon, last_name, first_name, middle_name, password, role_id, plant_id, is_active, is_requestor, is_admin, created_by, created_date, updated_by, updated_date, is_contact, contact_nos, position, 
                         img_filename, contact_seq_no, gender, birth_date, hired_date, termination_date, position_id, note, status_id, first_name + N' ' + CASE WHEN [middle_name] IS NULL 
                         THEN '' ELSE middle_name + ' ' END + last_name AS userFullName
FROM            dbo.users
