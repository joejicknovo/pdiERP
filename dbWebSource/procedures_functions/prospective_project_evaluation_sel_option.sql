
-- =============================================
-- Author:		Rogelio T. Novo Jr.
-- Create date: February 13, 2017 10:33 PM
-- Description:	Project prospective records per project. THis is use in contract particular as project
--              options in the selectionbox.
-- ===================================================================================================
-- Updated by	| Date		| Description
-- ===================================================================================================
-- Add your name, date, and description of your changes here. Thanks
-- ===================================================================================================
CREATE PROCEDURE [dbo].[prospective_project_evaluation_sel_option](
	@project_id INT = NULL
)

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sql NVARCHAR(MAX);

    SET @sql = 'SELECT * FROM dbo.prospective_project_evaluation_sel_option_v '

	IF @project_id IS NOT NULL  
		SET @sql = @sql + 'WHERE project_id =  ' + CAST(@project_id AS NVARCHAR(10)) + ' ';

	EXEC(@sql);		
END



