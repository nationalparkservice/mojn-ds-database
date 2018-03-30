CREATE TABLE [data].[InvasivesActivity] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]                 INT           NOT NULL,
    [InvasivesObservedID]     TINYINT       NOT NULL,
    [Notes]                   VARCHAR (500) NULL,
    [DataProcessingLevelID]   TINYINT       CONSTRAINT [DF_InvasivesActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0) CONSTRAINT [DF_InvasivesActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500) NULL,
    [DateCreated]             DATETIME2 (0) CONSTRAINT [DF_InvasivesActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_InvasivesActivity] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_InvasivesActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_InvasivesActivity_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_InvasivesActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_InvasivesActivity_InvasivesObserved] FOREIGN KEY ([InvasivesObservedID]) REFERENCES [lookup].[InvasivesObserved] ([ID]),
    CONSTRAINT [FK_InvasivesActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General invasives information', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.InvasivesObserved (indicates whether invasive species were observed at a spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'InvasivesObservedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comments for Invasives Event', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataProcessingLevel (indicates level of qa/qc that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';

