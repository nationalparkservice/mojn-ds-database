CREATE TABLE [data].[WaterQualityDO] (
    [ID]                       INT            IDENTITY (1, 1) NOT NULL,
    [WaterQualityActivityID]   INT            NOT NULL,
    [DissolvedOxygen_percent]  DECIMAL (5, 2) NOT NULL,
    [DissolvedOxygen_mg_per_L] DECIMAL (5, 2) NULL,
    [DataQualityFlagID]        TINYINT        NOT NULL,
    [DataQualityFlagNote]      VARCHAR (500)  NULL,
    [DateCreated]              DATETIME2 (0)  CONSTRAINT [DF_WaterQualityDO_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WaterQualityDO] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualityDissolvedOxygen_DissolvedOxygen_mg_per_L] CHECK ([DissolvedOxygen_mg_per_L]>=(0) AND [DissolvedOxygen_mg_per_L]<=(50)),
    CONSTRAINT [CK_WaterQualityDissolvedOxygen_DissolvedOxygen_percent] CHECK ([DissolvedOxygen_percent]>=(0) AND [DissolvedOxygen_percent]<=(300)),
    CONSTRAINT [CK_WaterQualityDO_DataQualityFlagNote_DisallowZeroLength] CHECK (len([DataQualityFlagNote])>(0)),
    CONSTRAINT [FK_WaterQualityDO_DataQualityFlag] FOREIGN KEY ([DataQualityFlagID]) REFERENCES [lookup].[DataQualityFlag] ([ID]),
    CONSTRAINT [FK_WaterQualityDO_WaterQualityActivity] FOREIGN KEY ([WaterQualityActivityID]) REFERENCES [data].[WaterQualityActivity] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dissolved oxygen measurements', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique primary key for Water Quality Dissolved Oxygen', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.WaterQualityEvent (general information about water quality measurements)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO', @level2type = N'COLUMN', @level2name = N'WaterQualityActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Percent measurement for Dissolved Oxygen', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO', @level2type = N'COLUMN', @level2name = N'DissolvedOxygen_percent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Measured value of Dissolved Oxygen in milligrams per liter', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO', @level2type = N'COLUMN', @level2name = N'DissolvedOxygen_mg_per_L';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataQualityFlag (indicates type and severity of data quality issue)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO', @level2type = N'COLUMN', @level2name = N'DataQualityFlagID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about data quality flag', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO', @level2type = N'COLUMN', @level2name = N'DataQualityFlagNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityDO', @level2type = N'COLUMN', @level2name = N'DateCreated';

