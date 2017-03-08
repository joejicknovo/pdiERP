CREATE VIEW dbo.employee_v
AS
SELECT        dbo.employee.employee_id, dbo.employee.employee_first_name, dbo.employee.employee_middle_name, dbo.employee.employee_last_name, dbo.employee.employee_gender, 
                         dbo.employee.employee_birth_date, dbo.employee.date_hired, dbo.employee.termination_date, dbo.employee.position_id, dbo.employee.user_id, dbo.employee.note, dbo.employee.status_id, 
                         dbo.employee.created_by, dbo.employee.created_date, dbo.employee.updated_by, dbo.employee.updated_date, dbo.users.logon AS username, dbo.users.password, dbo.users.role_id
FROM            dbo.employee LEFT OUTER JOIN
                         dbo.users ON dbo.employee.user_id = dbo.users.user_id
