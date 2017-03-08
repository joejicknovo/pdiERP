CREATE TABLE contract_particular_insurance(
contract_particular_insurance_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,insurance_id	INT	NOT NULL
,pdi_plant_equipment	DECIMAL(20)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)