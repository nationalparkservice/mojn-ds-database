CREATE TABLE [data].[DischargeVolumetricObservation] (
    [ID]                       INT            IDENTITY (1, 1) NOT NULL,
    [DischargeActivityID]      INT            NOT NULL,
    [ContainerVolume_mL]       SMALLINT       NOT NULL,
    [FillTime_seconds]         DECIMAL (5, 2) NOT NULL,
    [MeasurementTimeOfDay]     DATETIME2 (0)  NULL,
    [EstimatedCapture_percent] TINYINT        NULL,
    [DateCreated]              DATETIME2 (0)  CONSTRAINT [DF_DischargeVolumetricObservation_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargeVolumetricObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeVolumetricObservation_ContainerVolume_mL] CHECK ([ContainerVolume_mL]>=(50) AND [ContainerVolume_mL]<=(10000)),
    CONSTRAINT [CK_DischargeVolumetricObservation_EstimatedCapture_percent] CHECK ([EstimatedCapture_percent]>=(0) AND [EstimatedCapture_percent]<=(100)),
    CONSTRAINT [CK_DischargeVolumetricObservation_FillTime_seconds] CHECK ([FillTime_seconds]>=(1) AND [FillTime_seconds]<=(1000)),
    CONSTRAINT [CK_DischargeVolumetricObservation_MeasurementTimeOfDay] CHECK ([MeasurementTimeOfDay]>='1/1/2000' AND [MeasurementTimeOfDay]<=dateadd(minute,(5),getdate())),
    CONSTRAINT [FK_DischargeVolumetricObservation_DischargeActivity] FOREIGN KEY ([DischargeActivityID]) REFERENCES [data].[DischargeActivity] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Spring discharge calculated based on the time it takes to fill a container of known volume', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.DischargeEvent (general discharge information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation', @level2type = N'COLUMN', @level2name = N'DischargeActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Volume of container used', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation', @level2type = N'COLUMN', @level2name = N'ContainerVolume_mL';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'How long it took for container to fill', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation', @level2type = N'COLUMN', @level2name = N'FillTime_seconds';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not in use', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation', @level2type = N'COLUMN', @level2name = N'MeasurementTimeOfDay';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estimate of percentage of flow captured in container', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation', @level2type = N'COLUMN', @level2name = N'EstimatedCapture_percent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeVolumetricObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

