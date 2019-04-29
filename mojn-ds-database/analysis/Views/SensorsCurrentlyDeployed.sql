CREATE VIEW [analysis].[SensorsCurrentlyDeployed]
AS
SELECT      s.Label AS SensorNumber,
			s.SerialNumber AS SerialNumber,
			ds.Code AS SpringCode,
			ds.Name AS SpringName,
			dv.VisitDate AS DeploymentDate
FROM        ref.Sensor AS s
			LEFT JOIN data.SensorDeployment AS sd
			ON sd.SensorID = s.ID
			INNER JOIN data.Visit AS dv
			ON sd.VisitID = dv.ID
			LEFT JOIN data.SensorRetrievalAttempt AS sr
			ON sr.SensorDeploymentID = sd.ID
			LEFT JOIN data.Site AS ds
			ON dv.SiteID = ds.ID
WHERE		sr.ID IS NULL