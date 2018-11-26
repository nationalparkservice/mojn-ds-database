CREATE VIEW analysis.RETIRED_DischargeEstimated
AS
SELECT      d.ParkCode, 
			d.SiteCode,
			d.SiteName,
			d.VisitDate,
			d.VisitGroup, 
            d.FlowCondition,
			df.Code AS DischargeFlag,
			de.Discharge_L_per_min,
			d.VisitType, 
            d.DPL
FROM        intermediate.Discharge AS d
			INNER JOIN data.RETIRED_DischargeEstimatedObservation AS de
			ON d.DischargeActivityID = de.DischargeActivityID
			LEFT OUTER JOIN lookup.DischargeEstimatedFlag AS df
			ON de.DischargeEstimatedFlagID = df.ID
GO



