

CREATE PROCEDURE [dbo].[client_satisfaction_feedback_product_performance_sel]
(
	@user_id int = NULL,
    --@client_satisfaction_feedback_id  INT = NULL
	@client_satisfaction_feedback_id  INT
)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @sql NVARCHAR(MAX);

	SET @sql = N'SELECT b.client_satisfaction_feedback_id, b.client_satisfaction_feedback_product_performance_id ' +
		', a.product_service_performance_id, a.parameter, a.performance_criteria, b.status_id, c.status_name ' +
		'FROM dbo.product_service_performance a ' +
		'LEFT JOIN dbo.client_satisfaction_feedback_product_performance b ' +
		'ON a.product_service_performance_id = b.product_service_performance_id ' +
		'JOIN dbo.[status] c ' +
		'ON b.status_id = c.status_id ' +
		'WHERE 1 = 1 ' +
		'AND (b.client_satisfaction_feedback_id IS NULL OR b.client_satisfaction_feedback_id = ' + CAST(@client_satisfaction_feedback_id AS VARCHAR(50)) + ')'+
		'ORDER BY a.seq_no';

	EXEC(@sql);		
END

