CREATE TABLE [data].[DischargeEstimatedObservation] (
    [ID]                       INT           IDENTITY (1, 1) NOT NULL,
    [DischargeActivityID]      INT           NOT NULL,
    [DischargeEstimatedClassID]		   TINYINT			 NOT NULL,
    [DateCreated]              DATETIME2 (0) CONSTRAINT [DF_DischargeEstimatedObservation_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DischargeEstimatedObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_DischargeEstimatedObservation_DischargeActivity] FOREIGN KEY ([DischargeActivityID]) REFERENCES [data].[DischargeActivity] ([ID]),
    CONSTRAINT [FK_DischargeEstimatedObservation_DischargeEstimatedClass] FOREIGN KEY ([DischargeEstimatedClassID]) REFERENCES [lookup].[DischargeEstimatedClass] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Rough estimate of spring discharge, used when more precise measurement is not possible', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.DischargeActivity (general discharge information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'DischargeActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Estimated discharge range in liters per second', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'DischargeEstimatedClassID';


GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DischargeEstimatedObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

