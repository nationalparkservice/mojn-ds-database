CREATE VIEW intermediate.SiteVisit
AS
SELECT        Park.Code AS ParkCode, Site.Code AS SiteCode, Site.Name AS SiteName, Visit.VisitDate, qa.Water_Year(Visit.VisitDate) AS VisitGroup, lookup.VisitType.Label AS VisitType, Visit.ID AS VisitID, 
                         lookup.Subunit.Label AS Subunit, lookup.ProtectedStatus.Label AS ProtectedStatus, lookup.MonitoringStatus.Label AS MonitoringStatus, lookup.SpringType.Label AS SpringType, Visit.Notes,
                         lookup.DataProcessingLevel.Label AS VisitDPL, lookup.GRTSPanel.Code AS SampleFrame, Visit.MonitoringStatusID
FROM            lookup.SpringType RIGHT OUTER JOIN
                         lookup.DataProcessingLevel RIGHT OUTER JOIN
                         lookup.GRTSPanel RIGHT OUTER JOIN
                         lookup.MonitoringStatus RIGHT OUTER JOIN
                         data.Site AS Site INNER JOIN
                         lookup.Park AS Park ON Site.ParkID = Park.ID INNER JOIN
                         data.Visit AS Visit ON Site.ID = Visit.SiteID ON lookup.MonitoringStatus.ID = Visit.MonitoringStatusID ON lookup.GRTSPanel.ID = Site.GRTSPanelID ON 
                         lookup.DataProcessingLevel.ID = Visit.DataProcessingLevelID ON lookup.SpringType.ID = Visit.SpringTypeID LEFT OUTER JOIN
                         lookup.VisitType ON Visit.VisitTypeID = lookup.VisitType.ID LEFT OUTER JOIN
                         lookup.ProtectedStatus ON Site.ProtectedStatusID = lookup.ProtectedStatus.ID LEFT OUTER JOIN
                         lookup.Subunit ON Site.SubunitID = lookup.Subunit.ID
GO
