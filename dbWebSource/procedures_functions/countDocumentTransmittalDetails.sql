create FUNCTION [dbo].[countDocumentTransmittalDetails](
	@document_transmittal_id INT
) 
RETURNS INT 
AS
BEGIN
   DECLARE @count INT;

   SELECT @count = COUNT(*) 
   FROM dbo.document_transmittal_detail
   WHERE document_transmittal_id = @document_transmittal_id;

   RETURN @count;
END;

