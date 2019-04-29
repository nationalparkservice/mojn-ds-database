CREATE VIEW [analysis].[SensorsRetrieved]
AS
SELECT      s.Label AS SensorNumber,
			s.SerialNumber AS SerialNumber,
			dv.VisitDate AS DeploymentDate,
			rv.VisitDate AS RetrievalDate,
			ds.Name AS DeplSpringName,
			rs.Name AS RetSpringName,
			ds.Code AS SpringCode,
			ret.Code AS SensorRetrieved,
			sp.Label AS SensorProblem,
			dld.Code AS DownloadResult
FROM        ref.Sensor AS s
			LEFT JOIN data.SensorDeployment AS sd
			ON sd.SensorID = s.ID
			INNER JOIN data.Visit AS dv
			ON sd.VisitID = dv.ID
			INNER JOIN data.SensorRetrievalAttempt AS sr
			ON sr.SensorDeploymentID = sd.ID
			INNER JOIN data.Visit AS rv
			ON sr.VisitID = rv.ID
			INNER JOIN data.Site AS rs
			ON rv.SiteID = rs.ID
			INNER JOIN data.Site AS ds
			ON dv.SiteID = ds.ID
			LEFT JOIN lookup.SensorProblem AS sp
			ON sr.SensorProblemID = sp.ID
			LEFT JOIN lookup.IsSensorRetrieved AS ret
			ON sr.IsSensorRetrievedID = ret.ID
			LEFT JOIN lookup.IsDownloadSuccessful AS dld
			ON sr.IsDownloadSuccessfulID = dld.ID
