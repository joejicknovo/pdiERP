CREATE TYPE commercial_condition_tt AS TABLE(
commercial_condition_id	INT	NULL
,prospective_project_evaluation_id	INT	NULL
,contract_type	NVARCHAR(200)	NULL
,advance_payment	DECIMAL(20)	NULL
,payment_term_interim_payment	DECIMAL(20)	NULL
,payment_term_final_payment	DECIMAL(20)	NULL
,retention	DECIMAL(20)	NULL
,limit_of_retention	DECIMAL(20)	NULL
,liquidted_damage_penalty	DECIMAL(20)	NULL
,limit_penalty	DECIMAL(20)	NULL
,maintenance_period	INT	NULL)