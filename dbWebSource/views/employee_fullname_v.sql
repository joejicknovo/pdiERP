CREATE VIEW dbo.employee_fullname_v
AS
SELECT        TOP (100) PERCENT user_id, last_name + N', ' + first_name + N' ' + ISNULL(middle_name, N'') AS employee_fullname, position_id, status_id, is_active
FROM            dbo.users
