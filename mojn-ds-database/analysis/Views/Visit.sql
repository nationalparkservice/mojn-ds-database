CREATE VIEW analysis.Visit
AS
SELECT        ParkCode, Subunit, SiteCode, SiteName, VisitDate, VisitGroup, SampleFrame, VisitType, MonitoringStatus, SpringType, Notes, VisitDPL AS DPL
FROM            intermediate.SiteVisit
GO
