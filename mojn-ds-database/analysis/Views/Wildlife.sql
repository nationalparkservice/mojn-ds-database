CREATE VIEW [analysis].[Wildlife]
AS 
SELECT	sv.ParkCode,
		sv.SiteCode,
		sv.SiteName,
		sv.VisitDate,
		sv.VisitGroup,
		iw.Label AS IsWildlifeObserved,
		wt.Label AS WildlifeType,
		do.Label AS DirectObservation,
		sc.Label AS Scat,
		tr.Label AS Tracks, 
		sh.Label AS Shelter,
		fo.Label AS Foraging,
		vo.Label AS Vocalization,
		ot.Label AS OtherEvidence,
		wo.Notes,
        sv.VisitType,
		dpl.Label AS DPL
FROM    data.WildlifeActivity as wa
		INNER JOIN intermediate.SiteVisit AS sv
		ON wa.VisitID = sv.VisitID
		LEFT JOIN lookup.IsWildlifeObserved AS iw
		ON wa.IsWildlifeObservedID = iw.ID
		LEFT JOIN lookup.DataProcessingLevel AS dpl
		ON wa.DataProcessingLevelID = dpl.ID
		LEFT JOIN data.WildlifeObservation AS wo
		ON wa.ID = wo.WildlifeActivityID
		LEFT JOIN lookup.WildlifeType AS wt
		ON wo.WildlifeTypeID = wt.ID
		LEFT JOIN lookup.WildlifeEvidencePresent AS do
		ON wo.DirectObservation = do.ID
		LEFT JOIN lookup.WildlifeEvidencePresent AS sc
		ON wo.Scat = sc.ID
		LEFT JOIN lookup.WildlifeEvidencePresent AS tr
		ON wo.Tracks = tr.ID
		LEFT JOIN lookup.WildlifeEvidencePresent AS sh
		ON wo.Shelter = sh.ID
		LEFT JOIN lookup.WildlifeEvidencePresent AS fo
		ON wo.Foraging = fo.ID
		LEFT JOIN lookup.WildlifeEvidencePresent AS vo
		ON wo.Vocalization = vo.ID
		LEFT JOIN lookup.WildlifeEvidencePresent AS ot
		ON wo.OtherEvidence = ot.ID
WHERE	sv.VisitDate > {d '2018-11-04'} -- Exclude legacy data from this view
GO
