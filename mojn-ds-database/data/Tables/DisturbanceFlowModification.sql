CREATE TABLE [data].[DisturbanceFlowModification] (
    [ID]                    INT           IDENTITY (1, 1) NOT NULL,
    [DisturbanceActivityID] INT           NOT NULL,
    [ModificationTypeID]    TINYINT       NOT NULL,
    [DateCreated]           DATETIME2 (0) CONSTRAINT [DF_DisturbanceActivityModifications_DateCreated] DEFAULT (getdate()) NULL,
    CONSTRAINT [PK_DisturbanceActivityModifications] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_DisturbanceActivityFlowModification_DisturbanceActivity] FOREIGN KEY ([DisturbanceActivityID]) REFERENCES [data].[DisturbanceActivity] ([ID]),
    CONSTRAINT [FK_DisturbanceActivityFlowModification_ModificationType] FOREIGN KEY ([ModificationTypeID]) REFERENCES [lookup].[ModificationType] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Modifications to natural spring flow', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceFlowModification';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceFlowModification', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Disturbance (disturbance observed at spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceFlowModification', @level2type = N'COLUMN', @level2name = N'DisturbanceActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.ModificationType (type of modification to natural spring flow)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceFlowModification', @level2type = N'COLUMN', @level2name = N'ModificationTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceFlowModification', @level2type = N'COLUMN', @level2name = N'DateCreated';

