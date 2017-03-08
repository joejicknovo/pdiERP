CREATE TYPE document_transmittal_detail_tt AS TABLE(
document_transmittal_detail_id	INT	NULL
,document_transmittal_id	INT	NULL
,item	INT	NULL
,particulars	NVARCHAR(600)	NULL
,no_of_copies	INT	NULL)