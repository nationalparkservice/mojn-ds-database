CREATE VIEW [ref].[SensorRetrievalList]
	AS
SELECT      sd.ID AS DeploymentID,
			CAST(s.Label AS varchar) + ', deployed ' + CAST(CAST(dv.VisitDate AS date) AS varchar) AS SensorLabel,
			dv.SiteID AS DeploymentSiteID,
			sd.SensorID AS SensorID,
			sr.ID AS RetrievalAttemptID,
			ret.Code AS SensorRetrieved
FROM        ref.Sensor AS s
			INNER JOIN data.SensorDeployment AS sd
			ON sd.SensorID = s.ID
			INNER JOIN data.Visit AS dv
			ON sd.VisitID = dv.ID
			INNER JOIN data.SensorRetrievalAttempt AS sr
			ON sr.SensorDeploymentID = sd.ID
			LEFT JOIN lookup.IsSensorRetrieved AS ret
			ON sr.IsSensorRetrievedID = ret.ID

UNION

SELECT      sd.ID AS DeploymentID,
			CAST(s.Label AS varchar) + ', deployed ' + CAST(CAST(dv.VisitDate AS date) AS varchar) AS SensorLabel,
			dv.SiteID AS DeploymentSiteID,
			sd.SensorID AS SensorID,
			sr.ID AS RetrievalAttemptID,
			'NA' AS SensorRetrieved
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
