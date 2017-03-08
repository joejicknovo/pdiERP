

CREATE PROCEDURE [dbo].[bid_work_order_request_sel]
(
	@project_id INT = NULL
)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM dbo.work_order_request_v WHERE project_id = @project_id

END
