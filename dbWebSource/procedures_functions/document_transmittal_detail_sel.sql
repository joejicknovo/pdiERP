

CREATE PROCEDURE [dbo].[document_transmittal_detail_sel]
(
	@user_id int = NULL,
    @document_transmittal_id  INT
)
AS
BEGIN
	SET NOCOUNT ON;
  
	SELECT * 
	FROM dbo.document_transmittal_detail 
	WHERE document_transmittal_id = @document_transmittal_id
	
END


