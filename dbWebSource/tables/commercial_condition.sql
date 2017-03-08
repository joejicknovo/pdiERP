CREATE TABLE commercial_condition(
commercial_condition_id	INT IDENTITY(1,1)	NOT NULL
,prospective_project_evaluation_id	INT	NOT NULL
,contract_type	VARCHAR(100)	NOT NULL
,advance_payment	DECIMAL(20)	NOT NULL
,payment_term_interim_payment	DECIMAL(20)	NOT NULL
,payment_term_final_payment	DECIMAL(20)	NOT NULL
,performance_bond	DECIMAL(20)	NULL
,retention	DECIMAL(20)	NOT NULL
,limit_of_retention	DECIMAL(20)	NOT NULL
,liquidted_damage_penalty	DECIMAL(20)	NOT NULL
,limit_penalty	DECIMAL(20)	NOT NULL
,maintenance_period	INT	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)