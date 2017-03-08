CREATE TABLE insurance(
insurance_id	INT IDENTITY(1,1)	NOT NULL
,prospective_project_evaluation_id	INT	NOT NULL
,professional_indemnity_insurance	DECIMAL(20)	NULL
,contractor_all_risk_insurance	DECIMAL(20)	NULL
,third_party_liability_insurance	DECIMAL(20)	NULL
,workmen_compensation_insurance	DECIMAL(20)	NULL
,personal_accident	DECIMAL(20)	NULL
,automobile_insurance	DECIMAL(20)	NULL
,marine_insurance	DECIMAL(20)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)