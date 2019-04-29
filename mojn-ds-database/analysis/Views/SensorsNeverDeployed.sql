CREATE VIEW [analysis].[SensorsNeverDeployed]
AS
SELECT      s.Label AS SensorNumber,
			s.SerialNumber AS SerialNumber
FROM        ref.Sensor AS s
			LEFT JOIN data.SensorDeployment AS sd
			ON sd.SensorID = s.ID
WHERE		sd.ID IS NULL