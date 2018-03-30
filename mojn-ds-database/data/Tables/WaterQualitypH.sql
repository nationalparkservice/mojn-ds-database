CREATE TABLE [data].[WaterQualitypH] (
    [ID]                     INT            IDENTITY (1, 1) NOT NULL,
    [WaterQualityActivityID] INT            NOT NULL,
    [pH]                     DECIMAL (5, 2) NOT NULL,
    [DataQualityFlagID]      TINYINT        NOT NULL,
    [DataQualityFlagNote]    VARCHAR (500)  NULL,
    [DateCreated]            DATETIME2 (0)  CONSTRAINT [DF_WaterQualitypH_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WaterQualitypH] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualitypH_DataQualityFlagNote_DisallowZeroLength] CHECK (len([DataQualityFlagNote])>(0)),
    CONSTRAINT [CK_WaterQualitypH_pH] CHECK ([pH]>=(0) AND [pH]<=(14)),
    CONSTRAINT [FK_WaterQualitypH_DataQualityFlag] FOREIGN KEY ([DataQualityFlagID]) REFERENCES [lookup].[DataQualityFlag] ([ID]),
    CONSTRAINT [FK_WaterQualitypH_WaterQualityActivity] FOREIGN KEY ([WaterQualityActivityID]) REFERENCES [data].[WaterQualityActivity] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'pH measurements', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitypH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitypH', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.WaterQualityEvent (general information about water quality measurements)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitypH', @level2type = N'COLUMN', @level2name = N'WaterQualityActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Measurement of pH for Water Quality', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitypH', @level2type = N'COLUMN', @level2name = N'pH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataQualityFlag (indicates type and severity of data quality issue)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitypH', @level2type = N'COLUMN', @level2name = N'DataQualityFlagID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about data quality flag', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitypH', @level2type = N'COLUMN', @level2name = N'DataQualityFlagNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitypH', @level2type = N'COLUMN', @level2name = N'DateCreated';

