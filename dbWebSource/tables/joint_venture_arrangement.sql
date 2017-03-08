CREATE TABLE joint_venture_arrangement(
joint_venture_arrangement_id	INT IDENTITY(1,1)	NOT NULL
,contract_particular_id	INT	NOT NULL
,joint_venture_partner	VARCHAR(3000)	NULL
,joint_venture_leader	VARCHAR(3000)	NULL
,joint_venture_board_members	VARCHAR(3000)	NULL
,joint_venture_board_alternative_member	VARCHAR(3000)	NULL
,joint_venture_shares	VARCHAR(3000)	NULL
,created_by	INT	NOT NULL
,created_date	DATETIME	NOT NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)