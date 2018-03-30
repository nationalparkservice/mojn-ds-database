CREATE TABLE [data].[RiparianVegetationActivity] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]                 INT           NOT NULL,
    [IsVegetationObservedID]  TINYINT       NULL,
    [MistletoePresentID]      TINYINT       NULL,
    [Notes]                   VARCHAR (500) NULL,
    [DataProcessingLevelID]   TINYINT       CONSTRAINT [DF_RiparianVegetationActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0) CONSTRAINT [DF_RiparianVegetationActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (400) NULL,
    [DateCreated]             DATETIME2 (0) CONSTRAINT [DF_RiparianVegetationActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RiparianVegetationActivity] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_RiparianVegetationActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_RiparianVegetationActivity_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_RiparianVegetationActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_RiparianVegetationActivity_IsVegetationObserved] FOREIGN KEY ([IsVegetationObservedID]) REFERENCES [lookup].[IsVegetationObserved] ([ID]),
    CONSTRAINT [FK_RiparianVegetationActivity_MistletoePresent] FOREIGN KEY ([MistletoePresentID]) REFERENCES [lookup].[MistletoePresent] ([ID]),
    CONSTRAINT [FK_RiparianVegetationActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiparianVegetationActivity_VisitID]
    ON [data].[RiparianVegetationActivity]([VisitID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Overview of riparian vegetation', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.IsVegetationObserved (indicates whether riparian vegetation was observed at a spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'IsVegetationObservedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.MistletoePresent (indicates whether mistletoe was observed at the spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'MistletoePresentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comments about the riparian vegetation', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataProcessingLevel (indicates level of qa/qc that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';

