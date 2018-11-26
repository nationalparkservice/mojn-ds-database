CREATE VIEW [analysis].[DischargeEstimated]
AS
SELECT		d.ParkCode, 
			d.SiteCode,
			d.SiteName,
			d.VisitDate,
			d.VisitGroup, 
            d.FlowCondition,
			dc.Label AS DischargeClass_L_per_s,
			d.VisitType, 
            d.DPL
FROM		intermediate.Discharge AS d
			INNER JOIN data.DischargeEstimatedObservation AS de
			ON d.DischargeActivityID = de.DischargeActivityID
			LEFT JOIN lookup.DischargeEstimatedClass AS dc
			ON de.DischargeEstimatedClassID = dc.ID
