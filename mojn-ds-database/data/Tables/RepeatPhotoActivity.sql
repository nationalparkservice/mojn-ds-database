CREATE TABLE [data].[RepeatPhotoActivity] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [VisitID]                 INT           NOT NULL,
    [CameraID]                TINYINT       NOT NULL,
    [CameraCardID]            SMALLINT      NOT NULL,
    [DataProcessingLevelID]   TINYINT       CONSTRAINT [DF_RepeatPhotoActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0) CONSTRAINT [DF_RepeatPhotoActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (400) NULL,
    [DateCreated]             DATETIME2 (0) CONSTRAINT [DF_RepeatPhotoActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RepeatPhotoActivity] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_RepeatPhotoActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [FK_RepeatPhotoActivity_Camera] FOREIGN KEY ([CameraID]) REFERENCES [ref].[Camera] ([ID]),
    CONSTRAINT [FK_RepeatPhotoActivity_CameraCard] FOREIGN KEY ([CameraCardID]) REFERENCES [ref].[CameraCard] ([ID]),
    CONSTRAINT [FK_RepeatPhotoActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_RepeatPhotoActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RepeatPhotoActivity_VisitID_CameraID_CameraCardID]
    ON [data].[RepeatPhotoActivity]([VisitID] ASC, [CameraID] ASC, [CameraCardID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General information about repeat photos', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.Camera (all cameras used for monitoring, each with a unique identifier)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'CameraID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.CameraCard (camera memory cards, each with a unique identifier)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'CameraCardID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataProcessingLevel (indicates level of qa/qc that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';

