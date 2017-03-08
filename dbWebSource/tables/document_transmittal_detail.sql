CREATE TABLE document_transmittal_detail(
document_transmittal_detail_id	INT IDENTITY(1,1)	NOT NULL
,document_transmittal_id	INT	NOT NULL
,item	INT	NOT NULL
,particulars	NVARCHAR(600)	NOT NULL
,no_of_copies	INT	NOT NULL
,prepared_by	INT	NOT NULL
,prepared_date	DATETIME	NOT NULL
,received_by	INT	NULL
,received_date	DATETIME	NULL
,updated_by	INT	NULL
,updated_date	DATETIME	NULL)