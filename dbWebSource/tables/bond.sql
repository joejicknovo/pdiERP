CREATE TABLE bond(
bond_id	INT IDENTITY(1,1)	NOT NULL
,prospective_project_evaluation_id	INT	NOT NULL
,bid_bond	DECIMAL(20)	NOT NULL
,performance_bond	DECIMAL(20)	NOT NULL
,down_payment_bond	DECIMAL(20)	NOT NULL
,warranty_bond	DECIMAL(20)	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)