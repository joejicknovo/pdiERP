CREATE TABLE programme(
programme_id	INT IDENTITY(1,1)	NOT NULL
,prospective_project_evaluation_id	INT	NOT NULL
,duration	INT	NOT NULL
,prebid_conference	DATETIME	NOT NULL
,site_inspection	DATETIME	NOT NULL
,bid_submission	DATETIME	NOT NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)