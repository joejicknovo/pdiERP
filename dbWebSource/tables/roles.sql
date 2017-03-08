CREATE TABLE roles(
created_by	INT	NOT NULL
,created_date	DATETIMEOFFSET	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIMEOFFSET	NULL
,role_id	INT	NOT NULL
,role_name	NVARCHAR(40)	NOT NULL
,is_export_excel	VARCHAR(1)	NULL
,is_export_pdf	VARCHAR(1)	NULL
,is_import_excel	VARCHAR(1)	NULL)