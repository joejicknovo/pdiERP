CREATE TABLE material_color_schedule_grade(
material_color_schedule_grade_id	INT IDENTITY(1,1)	NOT NULL
,material_length_weight_rating_id	INT	NOT NULL
,material_color_schedule_grade_code	CHAR(1)	NOT NULL
,material_color_schedule_grade_name	NVARCHAR(600)	NOT NULL
,is_active	CHAR(1)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)