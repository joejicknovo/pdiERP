CREATE VIEW dbo.lead_other_relevant_information_v
AS
SELECT        dbo.prospective_project_evaluation.lead_id, dbo.other_relevant_information.other_relevant_information_id, dbo.other_relevant_information.prospective_project_evaluation_id, 
                         dbo.other_relevant_information.description
FROM            dbo.other_relevant_information LEFT OUTER JOIN
                         dbo.prospective_project_evaluation ON dbo.other_relevant_information.prospective_project_evaluation_id = dbo.prospective_project_evaluation.prospective_project_evaluation_id
