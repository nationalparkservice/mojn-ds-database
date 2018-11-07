CREATE VIEW analysis.Disturbance
AS
SELECT      sv.ParkCode,
			sv.SiteCode,
			sv.SiteName,
			sv.VisitDate,
			sv.VisitGroup,
			rd.Code AS Roads, 
            hu.Code AS HumanUse,
			pm.Code AS PlantManagement,
			ht.Code AS HikingTrails,
			li.Code AS Livestock,
			oa.Code AS OtherAnthropogenic, 
            fi.Code AS Fire,
			fl.Code AS Flooding,
			wi.Code AS Wildlife,
			ot.Code AS OtherNatural,
			ov.Code AS Overall, 
            fm.Label AS FlowModificationStatus,
			sv.VisitType,
			dpl.Label AS DPL
FROM        data.DisturbanceActivity AS da
			INNER JOIN intermediate.SiteVisit AS sv
			ON da.VisitID = sv.VisitID
			LEFT JOIN lookup.FlowModificationStatus AS fm
			ON da.FlowModificationStatusID = fm.ID
			LEFT JOIN lookup.DataProcessingLevel AS dpl
			ON da.DataProcessingLevelID = dpl.ID
			LEFT JOIN lookup.DisturbanceClass AS rd
			ON da.Roads = rd.ID
			LEFT JOIN lookup.DisturbanceClass AS hu
			ON da.HumanUse = hu.ID
			LEFT JOIN lookup.DisturbanceClass AS pm
			ON da.PlantManagement = pm.ID
			LEFT JOIN lookup.DisturbanceClass AS ht
			ON da.HikingTrails = ht.ID
			LEFT JOIN lookup.DisturbanceClass AS li
			ON da.Livestock = li.ID
			LEFT JOIN lookup.DisturbanceClass AS oa
			ON da.OtherAnthropogenic = oa.ID
			LEFT JOIN lookup.DisturbanceClass AS fi
			ON da.Fire = fi.ID
			LEFT JOIN lookup.DisturbanceClass AS fl
			ON da.Flooding = fl.ID
			LEFT JOIN lookup.DisturbanceClass AS wi
			ON da.Wildlife = wi.ID
			LEFT JOIN lookup.DisturbanceClass AS ot
			ON da.OtherNatural = ot.ID
			LEFT JOIN lookup.DisturbanceClass AS ov
			ON da.Overall = ov.ID
GO
