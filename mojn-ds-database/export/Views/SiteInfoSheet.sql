CREATE VIEW [export].[SiteInfoSheet]
	AS
SELECT	v.ParkCode,
	v.SiteCode,
	v.SiteName,
	v.VisitDate,
	v.VisitGroup,
	v.SpringType,
	v.Notes AS VisitNotes,
	v.SampleFrame,
	pd.Code AS PhotoType,
	pd.Label AS PhotoLabel,
	p.RenamedFilePath,
	p.UtmX_m,
	p.UtmY_m,
	z.Code AS UTMZone,
	sd.Notes AS SensorNotes,
	p.Notes AS PhotoNotes
FROM
(SELECT	SiteCode,
		MAX(VisitDate) AS MostRecentVisit
FROM	intermediate.SiteVisit
WHERE	VisitType = 'Primary' AND MonitoringStatus = 'Sampled'
GROUP BY	SiteCode) AS rv
INNER JOIN	intermediate.SiteVisit AS v
ON			v.SiteCode = rv.SiteCode AND v.VisitDate = rv.MostRecentVisit
LEFT JOIN	data.PhotoActivity AS pa
ON			pa.VisitID = v.VisitID
LEFT JOIN	data.Photo AS p
ON			p.PhotoActivityID = pa.ID
LEFT JOIN	ref.PhotoDescriptionCode AS pd
ON			p.PhotoDescriptionCodeID = pd.ID
LEFT JOIN	lookup.UTMZone AS z
ON			p.UTMZoneID = z.ID
LEFT JOIN	data.SensorDeployment AS sd
ON			sd.VisitID = v.VisitID
WHERE		pd.Code IN ('SOURCE', 'UPSTR', 'DNSTR', 'SENSOR')
