CREATE TABLE [data].[WaterQualitySpCond] (
    [ID]                                INT            IDENTITY (1, 1) NOT NULL,
    [WaterQualityActivityID]            INT            NOT NULL,
    [SpecificConductance_microS_per_cm] DECIMAL (6, 1) NOT NULL,
    [DateCreated]                       DATETIME2 (0)  CONSTRAINT [DF_WaterQualitySpCond_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WaterQualitySpCond] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualitySpCond_SpecificConductance_microS_per_cm] CHECK ([SpecificConductance_microS_per_cm]>=(0) AND [SpecificConductance_microS_per_cm]<=(100000)),
    CONSTRAINT [FK_WaterQualitySpCond_WaterQualityActivity] FOREIGN KEY ([WaterQualityActivityID]) REFERENCES [data].[WaterQualityActivity] ([ID])
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specific conductance measurements', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.WaterQualityEvent (general information about water quality measurements)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'WaterQualityActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specific conductance measurement in microsiemens per centimeter', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'SpecificConductance_microS_per_cm';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualitySpCond', @level2type = N'COLUMN', @level2name = N'DateCreated';

