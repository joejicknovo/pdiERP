CREATE TYPE contract_particular_financial_tt AS TABLE(
contract_particular_financial_id	INT	NULL
,contract_particular_id	INT	NULL
,contract_sum	DECIMAL(20)	NULL
,budgeted_cost	DECIMAL(20)	NULL
,budgeted_oh_profit_amount	DECIMAL(20)	NULL
,budgeted_oh_profit_percent_cost	DECIMAL(20)	NULL
,budgeted_oh_profit_percent_turnover	DECIMAL(20)	NULL)