CREATE VIEW dbo.terms_v
AS
SELECT        term_id, term, is_active, created_by, dbo.getEmployeeFullName(created_by) AS created_by_name, created_date, updated_by, dbo.getEmployeeFullName(updated_by) AS updated_by_name, updated_date
FROM            dbo.terms
