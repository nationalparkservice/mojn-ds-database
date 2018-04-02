CREATE TABLE [data].[SensorRetrievalAttempt] (
    [ID]                     INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]                INT           NOT NULL,
    [SensorDeploymentID]     INT           NOT NULL,
    [IsSensorRetrievedID]      TINYINT       NOT NULL,
    [SensorProblemID]        TINYINT       NOT NULL,
    [RetrievalTimeOfDay]     DATETIME2 (0) NULL,
    [IsDownloadSuccessfulID] TINYINT       NULL,
    [Notes]                  VARCHAR (500) NULL,
    [DateCreated]            DATETIME2 (0) CONSTRAINT [DF_SensorRetrievalAttempt_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SensorRetrievalAttempt] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SensorRetrievalAttempt_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_SensorRetrievalAttempt_Notes_DisallowZeroLengthString] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_SensorRetrievalAttempt_OneSuccessfulRetrievalPerDeployment] CHECK ([qa].[Sensor_Validate_OneSuccessfulRetrievalPerDeployment]([VisitID],[SensorDeploymentID],[RetrievalTimeOfDay],[IsSensorRetrievedID])=(1)),
    CONSTRAINT [FK_SensorRetrievalAttempt_IsDownloadSuccessful] FOREIGN KEY ([IsDownloadSuccessfulID]) REFERENCES [lookup].[IsDownloadSuccessful] ([ID]),
    CONSTRAINT [FK_SensorRetrievalAttempt_IsSensorRetrieved] FOREIGN KEY ([IsSensorRetrievedID]) REFERENCES [lookup].[IsSensorRetrieved] ([ID]),
    CONSTRAINT [FK_SensorRetrievalAttempt_SensorDeployment] FOREIGN KEY ([SensorDeploymentID]) REFERENCES [data].[SensorDeployment] ([ID]),
    CONSTRAINT [FK_SensorRetrievalAttempt_SensorProblem] FOREIGN KEY ([SensorProblemID]) REFERENCES [lookup].[SensorProblem] ([ID]),
    CONSTRAINT [FK_SensorRetrievalAttempt_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SensorRetrieval_VisitID_SensorDeploymentID]
    ON [data].[SensorRetrievalAttempt]([VisitID] ASC, [SensorDeploymentID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Information about attempts to retrieve iButton humidity sensors', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.SensorDeployment (information about ibutton humidity sensor deployment)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'SensorDeploymentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Was sensor retreived (Y/N)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = 'IsSensorRetrievedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.SensorProblem (problems with retrieved sensor)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'SensorProblemID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sensor retrieval time. Not recorded prior to 1/6/2017.', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'RetrievalTimeOfDay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.IsDownloadSuccessful (indicates whether sensor data were downloaded successfully)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'IsDownloadSuccessfulID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sensor retrieval notes', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorRetrievalAttempt', @level2type = N'COLUMN', @level2name = N'DateCreated';

