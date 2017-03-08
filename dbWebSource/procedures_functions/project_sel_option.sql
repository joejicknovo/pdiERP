
-- =============================================
-- Author:		Rogelio T. Novo Jr.
-- Create date: October 13, 2016 11:48 PM
-- Description:	Project select options.
-- ===================================================================================================
-- Updated by	| Date		| Description
-- ===================================================================================================
-- RNovo		| 2/7/2017	| Added more fields.
-- RNovo		| 2/13/2017	| Added @project_id parameter.
-- ===================================================================================================
CREATE PROCEDURE [dbo].[project_sel_option](
	@project_id INT = NULL
)

AS
BEGIN
	SET NOCOUNT ON;

    SELECT project_id, 
		project_name,
		project_no, 
		project_site_name,
		client_name,
		form_contract,
		form_subcontract,
		system_measurement
	FROM dbo.project_v
	WHERE project_id = @project_id
	ORDER BY project_name ASC;

END


