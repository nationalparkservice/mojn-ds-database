CREATE TABLE [data].[WaterQualityTemperature] (
    [ID]                     INT            IDENTITY (1, 1) NOT NULL,
    [WaterQualityActivityID] INT            NOT NULL,
    [WaterTemperature_C]     DECIMAL (5, 2) NOT NULL,
    [DateCreated]            DATETIME2 (0)  CONSTRAINT [DF_WaterQualityTemperature_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WaterQualityTemperature] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualityTemperature_WaterTemperature_C] CHECK ([WaterTemperature_C]>=(-5) AND [WaterTemperature_C]<=(60)),
    CONSTRAINT [FK_WaterQualityTemperature_WaterQualityActivity] FOREIGN KEY ([WaterQualityActivityID]) REFERENCES [data].[WaterQualityActivity] ([ID])
);






GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temperature measurements', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.WaterQualityEvent (general information about water quality measurements)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'WaterQualityActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temperature measurement in degrees C', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'WaterTemperature_C';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityTemperature', @level2type = N'COLUMN', @level2name = N'DateCreated';

