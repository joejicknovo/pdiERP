CREATE TABLE contract_particular_bond(
contract_particular_bond_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,bond_id	INT	NOT NULL
,retention_bond	DECIMAL(20)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)