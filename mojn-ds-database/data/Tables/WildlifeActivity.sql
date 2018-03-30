CREATE TABLE [data].[WildlifeActivity] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]                 INT           NOT NULL,
    [IsWildlifeObservedID]    TINYINT       NOT NULL,
    [DataProcessingLevelID]   TINYINT       CONSTRAINT [DF_WildlifeActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0) CONSTRAINT [DF_WildlifeActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500) NULL,
    [DateCreated]             DATETIME2 (0) CONSTRAINT [DF_WildlifeActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WildlifeActivity] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WildlifeActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [FK_WildlifeActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_WildlifeActivity_IsWildlifeObserved] FOREIGN KEY ([IsWildlifeObservedID]) REFERENCES [lookup].[IsWildlifeObserved] ([ID]),
    CONSTRAINT [FK_WildlifeActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_WildlifeActivity_VisitID]
    ON [data].[WildlifeActivity]([VisitID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General wildlife information', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.IsWildlifeObserved (indicates whether evidence of wildlife was observed at a spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity', @level2type = N'COLUMN', @level2name = N'IsWildlifeObservedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataProcessingLevel (indicates level of qa/qc that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';

