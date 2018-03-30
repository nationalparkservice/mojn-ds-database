CREATE TABLE [data].[DischargeEstimatedObservation] (
    [ID]                       INT           IDENTITY (1, 1) NOT NULL,
    [DischargeActivityID]      INT           NOT NULL,
    [Discharge_L_per_min]      SMALLINT      NOT NULL,
    [DischargeEstimatedFlagID] TINYINT       NULL,
    [DateCreated]              DATETIME2 (0) CONSTRAINT [DF_DischargeEstimatedObservation_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargeEstimatedObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeEstimatedObservation_Discharge_L_per_min] CHECK ([Discharge_L_per_min]>=(0) AND [Discharge_L_per_min]<=(1000)),
    CONSTRAINT [FK_DischargeEstimatedObservation_DischargeActivity] FOREIGN KEY ([DischargeActivityID]) REFERENCES [data].[DischargeActivity] ([ID]),
    CONSTRAINT [FK_DischargeEstimatedObservation_DischargeEstimatedFlag] FOREIGN KEY ([DischargeEstimatedFlagID]) REFERENCES [lookup].[DischargeEstimatedFlag] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rough estimate of spring discharge, used when more precise measurement is not possible', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.DischargeEvent (general discharge information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'DischargeActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estimated discharge in liters per minute', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'Discharge_L_per_min';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DischargeEstimatedFlag (indicates whether estimated discharge is less than the reported value)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'DischargeEstimatedFlagID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

