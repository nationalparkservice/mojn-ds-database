CREATE VIEW [temp].[MissingPhotos]
	AS 
select s.Code AS SpringCode,
	v.VisitDate,
	rt.Code AS PhotoDescription,
	ro.Notes AS Notes,
	v.Notes AS VisitNotes
from
data.RepeatPhotoObservation ro
left join data.RepeatPhoto rp on rp.RepeatPhotoObservationID = ro.ID
left join lookup.RepeatPhotoType rt on ro.RepeatPhotoTypeID = rt.ID
left join data.RepeatPhotoActivity ra on ro.RepeatPhotoActivityID = ra.ID
left join data.Visit v on ra.VisitID = v.ID
left join data.Site s on v.SiteID = s.ID
where rp.PhotoFileNumber IS NULL
union
select s.Code AS SpringCode,
	v.VisitDate,
	lf.Code + IIF(rv.DominantSpecies IS NOT NULL, ' - ' + rv.DominantSpecies, '') AS PhotoDescription,
	rva.Notes AS Notes,
	v.Notes AS VisitNotes
from data.RiparianVegetationObservation rv
left join data.RiparianVegetationPhoto rvp on rv.ID = rvp.RiparianVegetationObservationID
left join lookup.LifeForm lf on rv.LifeFormID = lf.ID
left join data.RiparianVegetationActivity rva on rv.RiparianVegetationActivityID = rva.ID
left join data.Visit v on rva.VisitID = v.ID
left join data.Site s on v.SiteID = s.ID
where rvp.PhotoFileNumber IS NULL
