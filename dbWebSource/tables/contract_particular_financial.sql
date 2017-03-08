CREATE TABLE contract_particular_financial(
contract_particular_financial_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,contract_sum	DECIMAL(20)	NULL
,budgeted_cost	DECIMAL(20)	NULL
,budgeted_oh_profit_amount	DECIMAL(20)	NULL
,budgeted_oh_profit_percent_cost	DECIMAL(20)	NULL
,budgeted_oh_profit_percent_turnover	DECIMAL(20)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)