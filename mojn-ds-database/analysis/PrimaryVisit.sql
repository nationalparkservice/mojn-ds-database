CREATE VIEW [analysis].[PrimaryVisit]
AS SELECT
		park.Code AS Park,
		spring.Code AS SpringCode,
		spring.Name AS SpringName,
		visit.VisitDate,
		visit.StartTime,
		s_type.Label AS SpringType
	FROM [data].[Site] As spring 
	INNER JOIN [data].[Visit] AS visit ON visit.SiteID = spring.ID
	INNER JOIN [lookup].[Park] AS park ON spring.ParkID = park.ID
	INNER JOIN [lookup].[SpringType] AS s_type ON visit.SpringTypeID = s_type.ID
	WHERE [visit].[VisitTypeID] = 1

