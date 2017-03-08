CREATE VIEW dbo.user_role_v
AS
SELECT        TOP (100) PERCENT u.user_id, u.logon, u.last_name, u.first_name, u.middle_name, u.password, u.role_id, u.plant_id, u.is_active, u.is_requestor, u.is_admin, u.created_by, u.created_date, u.updated_by, 
                         u.updated_date, u.is_contact, u.contact_nos, u.position, u.img_filename, u.contact_seq_no, u.gender, u.birth_date, u.hired_date, u.termination_date, u.position_id, u.note, u.status_id, u.userFullName, 
                         r.role_name, r.is_export_excel, r.is_export_pdf, r.is_import_excel
FROM            dbo.users_v AS u LEFT OUTER JOIN
                         dbo.roles AS r ON u.role_id = r.role_id
