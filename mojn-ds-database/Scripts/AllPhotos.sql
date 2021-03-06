SELECT
	pa.ID AS PhotoActivityID,
	v.ID AS VisitID,
	2 AS SOPID,
	rvp.PhotoFileNumber AS FileNumber,
	lf.Code AS PhotoDescription,
	pc.Code AS PhotoDescriptionCode,
	9 AS IsLibraryPhotoID,
	NULL AS OriginalFilePath,
	NULL AS RenamedFilePath,
	ra.Notes AS Notes,
	NULL AS UtmX_m,
	NULL AS UtmY_m,
	NULL AS GPSUnitID,
	NULL AS HorizontalDatumID,
	NULL AS UTMZoneID,
	c.Label AS Camera,
	cc.Label AS CameraCard,
	v.VisitDate AS VisitDate,
	v.StartTime AS VisitTime,
	s.Code AS SiteCode
FROM data.RiparianVegetationPhoto rvp
LEFT JOIN data.RiparianVegetationObservation ro ON rvp.RiparianVegetationObservationID = ro.ID
LEFT JOIN lookup.LifeForm lf ON ro.LifeFormID = lf.ID
LEFT JOIN data.RiparianVegetationActivity ra ON ro.RiparianVegetationActivityID = ra.ID
LEFT JOIN data.Visit v ON ra.VisitID = v.ID
LEFT JOIN data.PhotoActivity pa ON v.ID = pa.VisitID
LEFT JOIN data.Site s ON v.SiteID = s.ID
LEFT JOIN ref.Camera c ON pa.CameraID = c.ID
LEFT JOIN ref.CameraCard cc ON pa.CameraCardID = cc.ID
LEFT JOIN ref.PhotoDescriptionCode pc ON pc.Code = lf.Code AND pc.PhotoSOPID = 2

UNION

SELECT
	pa.ID AS PhotoActivityID,
	v.ID AS VisitID,
	1 AS SOPID,
	rp.PhotoFileNumber AS FileNumber,
	rt.Code AS PhotoDescription,
	pc.Code AS PhotoDescriptionCode,
	9 AS IsLibraryPhotoID,
	NULL AS OriginalFilePath,
	NULL AS RenamedFilePath,
	ro.Notes AS Notes,
	ro.UtmX_m,
	ro.UtmY_m,
	ro.GPSUnitID,
	ro.HorizontalDatumID,
	ro.UTMZone AS UTMZoneID,
	c.Label AS Camera,
	cc.Label AS CameraCard,
	v.VisitDate AS VisitDate,
	v.StartTime AS VisitTime,
	s.Code AS SiteCode
FROM
data.RepeatPhoto rp
LEFT JOIN data.RepeatPhotoObservation ro ON rp.RepeatPhotoObservationID = ro.ID
LEFT JOIN lookup.RepeatPhotoType rt ON ro.RepeatPhotoTypeID = rt.ID
LEFT JOIN data.RepeatPhotoActivity ra ON ro.RepeatPhotoActivityID = ra.ID
LEFT JOIN data.PhotoActivity pa ON ra.VisitID = pa.VisitID
LEFT JOIN ref.Camera c ON pa.CameraID = c.ID
LEFT JOIN ref.CameraCard cc ON pa.CameraCardID = cc.ID
LEFT JOIN data.Visit v ON ra.VisitID = v.ID
LEFT JOIN data.Site s ON v.SiteID = s.ID
LEFT JOIN ref.PhotoDescriptionCode pc ON pc.Code = rt.Code AND pc.PhotoSOPID = 1

UNION

SELECT
	pa.ID AS PhotoActivityID,
	v.ID AS VisitID,
	3 AS SOPID,
	ip.PhotoFileNumber AS FileNumber,
	t.USDAPlantsCode AS PhotoDescription,
	pc.Code AS PhotoDescriptionCode,
	9 AS IsLibraryPhotoID,
	NULL AS OriginalFilePath,
	NULL AS RenamedFilePath,
	inv.SpeciesNotes AS Notes,
	inv.UtmX_m AS UtmX_m,
	inv.UtmY_m AS UtmY_m,
	inv.GPSUnitID AS GPSUnitID,
	inv.HorizontalDatumID AS HorizontalDatumID,
	inv.UTMZoneID AS UTMZoneID,
	c.Label AS Camera,
	cc.Label AS CameraCard,
	v.VisitDate AS VisitDate,
	v.StartTime AS VisitTime,
	s.Code AS SiteCode
FROM data.InvasivesPhoto ip
LEFT JOIN data.InvasivesObservation inv ON ip.InvasivesObservationID = inv.ID
LEFT JOIN ref.Taxon t ON inv.TaxonID = t.ID
LEFT JOIN data.InvasivesActivity ia ON inv.InvasivesActivityID = ia.ID
LEFT JOIN data.Visit v ON ia.VisitID = v.ID
LEFT JOIN data.PhotoActivity pa ON v.ID = pa.VisitID
LEFT JOIN data.Site s ON v.SiteID = s.ID
LEFT JOIN ref.Camera c ON pa.CameraID = c.ID
LEFT JOIN ref.CameraCard cc ON pa.CameraCardID = cc.ID
LEFT JOIN ref.PhotoDescriptionCode pc ON pc.Code = t.USDAPlantsCode AND pc.PhotoSOPID = 3

UNION

SELECT
	pa.ID AS PhotoActivityID,
	v.ID AS VisitID,
	9 AS SOPID,
	mp.PhotoFileNumber AS FileNumber,
	'MISC' AS PhotoDescription,
	'MISC' AS PhotoDescriptionCode,
	9 AS IsLibraryPhotoID,
	NULL AS OriginalFilePath,
	NULL AS RenamedFilePath,
	mp.PhotoDescription AS Notes,
	NULL AS UtmX_m,
	NULL AS UtmY_m,
	NULL AS GPSUnitID,
	NULL AS HorizontalDatumID,
	NULL AS UTMZoneID,
	c.Label AS Camera,
	cc.Label AS CameraCard,
	v.VisitDate AS VisitDate,
	v.StartTime AS VisitTime,
	s.Code AS SiteCode
FROM MOJN_DS.dbo.MiscellaneousPhotos mp
LEFT JOIN data.Visit v ON mp.SpringLocationVisitID = v.ID
LEFT JOIN data.PhotoActivity pa ON v.ID = pa.VisitID
LEFT JOIN data.Site s ON v.SiteID = s.ID
LEFT JOIN ref.Camera c ON pa.CameraID = c.ID
LEFT JOIN ref.CameraCard cc ON pa.CameraCardID = cc.ID
