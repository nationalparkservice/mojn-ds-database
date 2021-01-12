CREATE VIEW analysis.CalibrationDO
AS
SELECT        sv.Park, sv.SiteCode, sv.SiteName, sv.VisitDate, sv.StartTime, sv.FieldSeason, sv.VisitType, CAST(cal.CalibrationDate AS DATE) AS CalibrationDate, CAST(cal.CalibrationTime AS TIME) AS CalibrationTime, 
                         wqi.Label AS DOInstrument, cal.BarometricPressure_mmHg, cal.PreCalibrationReading_percent, cal.PreCalibrationTemperature_C, cal.PostCalibrationReading_percent, cal.PostCalibrationTemperature_C, cal.Notes
FROM            intermediate.VisitDOCalibrationCrosswalk AS cw INNER JOIN
                         intermediate.SiteVisit AS sv ON cw.VisitID = sv.VisitID INNER JOIN
                         data.CalibrationDO_Shared AS cal ON cw.CalibrationID = cal.ID LEFT OUTER JOIN
                         ref.WaterQualityInstrument_Shared AS wqi ON cal.DOInstrumentID = wqi.ID
GO
