CREATE TABLE [data].[SensorDeployment] (
    [ID]                  INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]             INT           NOT NULL,
    [SensorID]            SMALLINT      NOT NULL,
    [DeploymentTimeOfDay] DATETIME2 (0) NULL,
    [Notes]               VARCHAR (500) NULL,
    [DateCreated]         DATETIME2 (0) CONSTRAINT [DF_SensorDeployment_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SensorDeployment] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SensorDeployment_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_SensorDeployment_Notes_DisallowZeroLengthString] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_SensorDeployment_Sensor] FOREIGN KEY ([SensorID]) REFERENCES [ref].[Sensor] ([ID]),
    CONSTRAINT [FK_SensorDeployment_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SensorDeployment_VisitID_SensorID]
    ON [data].[SensorDeployment]([VisitID] ASC, [SensorID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Information about iButton humidity sensor deployment', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorDeployment';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorDeployment', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorDeployment', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.Sensor (sensors used to detect presence/absence of water at a spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorDeployment', @level2type = N'COLUMN', @level2name = N'SensorID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sensor deployment time. Not recorded prior to 1/6/2017.', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorDeployment', @level2type = N'COLUMN', @level2name = N'DeploymentTimeOfDay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes on the sensor deployment', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorDeployment', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorDeployment', @level2type = N'COLUMN', @level2name = N'DateCreated';

