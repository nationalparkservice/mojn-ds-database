
-- =============================================
-- Author:		Simon Kingston
-- Create date: 10/8/2015
-- Description:	Given a SensorDeploymentID and a retrieval date, make sure that only one successful retrieval exists for a deployment
-- Edits: 2/23/2016 by Sarah Wright. We are not using WaterQuantityEvent and instead linking directly to SpringLocationVisit. Code has been modified accordingly.
--		  06/01/2017 by Kim Kitley.  Altered based on table name change from SpringLocationVisit to Visit and column name SpringLocationVisitID to VisitID
-- =============================================
CREATE FUNCTION [qa].[Sensor_Validate_OneSuccessfulRetrievalPerDeployment]
(
	--@waterQuantityEventID int,
	@VisitID int,
	@sensorDeploymentID int,
	@retrievalTimeOfDay datetime2(0),
	@isSensorRetrieved bit
)
RETURNS bit
AS
BEGIN
	-- Declare the return variable here
	DECLARE 
		@Result bit, 
		@existingSuccessfulRetrievalDate datetime2(0),
		@existingSuccessfulRetrieval bit,
		@resolvedCurrentRetrievalDate datetime2(0),
		@maxUnsuccessfulRetrievalDate datetime2(0);
	
	-- Get retrieval date from SensorRetrievalAttempt
	SELECT @resolvedCurrentRetrievalDate = @retrievalTimeOfDay;
	
	-- If retrieval date is not being stored, use SpringLocationVisit start date.
	IF @resolvedCurrentRetrievalDate IS NULL
		SELECT @resolvedCurrentRetrievalDate = VisitDate
		FROM [data].[Visit]
		WHERE ID = @VisitID
		--SELECT @resolvedCurrentRetrievalDate = COALESCE(wqe.MeasurementStartTime,slv.VisitDateStart)
		--FROM 
		--	dbo.WaterQuantityEvent wqe
		--	INNER JOIN dbo.SpringLocationVisit slv
		--		ON wqe.SpringLocationVisitID = slv.ID
		--WHERE wqe.ID = @waterQuantityEventID;
	
	-- Check whether there is already a successful sensor retrieval for this sensor deployment and spring location visit.	
	SELECT 
		@existingSuccessfulRetrieval = IsSensorRetrieved,
		@existingSuccessfulRetrievalDate = COALESCE(sra.RetrievalTimeOfDay,/*wqe.MeasurementStartTime,*/slv.VisitDate)
	FROM
		data.SensorRetrievalAttempt sra
		--INNER JOIN dbo.WaterQuantityEvent wqe ON sra.WaterQuantityEventID = wqe.ID
		INNER JOIN data.Visit slv ON sra.VisitID = slv.ID
	WHERE
		sra.SensorDeploymentID = @sensorDeploymentID
		AND IsSensorRetrieved = 1
		AND sra.VisitID <> @VisitID;
	
	SELECT @existingSuccessfulRetrieval = ISNULL(@existingSuccessfulRetrieval,0);

	SELECT TOP 1 @maxUnsuccessfulRetrievalDate = COALESCE(sra.RetrievalTimeOfDay,/*wqe.MeasurementStartTime,*/slv.VisitDate)
	FROM 
		data.SensorRetrievalAttempt sra
		--INNER JOIN dbo.WaterQuantityEvent wqe ON sra.WaterQuantityEventID = wqe.ID
		INNER JOIN data.Visit slv ON sra.VisitID = slv.ID
	WHERE sra.SensorDeploymentID = @sensorDeploymentID AND sra.IsSensorRetrieved = 0
	ORDER BY slv.VisitDate DESC;
			
	SELECT @Result = 
	CASE
		WHEN @existingSuccessfulRetrieval = 0 AND @isSensorRetrieved = 0 THEN 1
		WHEN @existingSuccessfulRetrieval = 0 AND @isSensorRetrieved = 1 AND (@maxUnsuccessfulRetrievalDate IS NULL OR @resolvedCurrentRetrievalDate > @maxUnsuccessfulRetrievalDate) THEN 1
		WHEN @existingSuccessfulRetrieval = 1 AND @isSensorRetrieved = 0 AND @existingSuccessfulRetrievalDate > @resolvedCurrentRetrievalDate THEN 1
		ELSE 0 
	END;
	
	-- Return the result of the function
	RETURN @Result;

END




