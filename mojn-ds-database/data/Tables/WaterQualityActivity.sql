CREATE TABLE [data].[WaterQualityActivity] (
    [ID]                          INT            IDENTITY (1, 1) NOT NULL,
    [VisitID]                     INT            NOT NULL,
    [WaterQualityDataCollectedID] TINYINT        NULL,
    [pHInstrumentID]              TINYINT        NULL,
    [DOInstrumentID]              TINYINT        NULL,
    [SpCondInstrumentID]          TINYINT        NULL,
    [TemperatureInstrumentID]     TINYINT        NULL,
    [Notes]                       VARCHAR (2000) NULL,
    [DataProcessingLevelID]       TINYINT        CONSTRAINT [DF_WaterQualityActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate]     DATETIME2 (0)  CONSTRAINT [DF_WaterQualityActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote]     VARCHAR (500)  NULL,
    [DateCreated]                 DATETIME2 (0)  CONSTRAINT [DF_WaterQualityActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WaterQualityActivity] PRIMARY KEY NONCLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualityActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_WaterQualityActivity_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_WaterQualityActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_WaterQualityActivity_DOInstrument] FOREIGN KEY ([DOInstrumentID]) REFERENCES [ref].[WaterQualityInstrument] ([ID]),
    CONSTRAINT [FK_WaterQualityActivity_pHInstrument] FOREIGN KEY ([pHInstrumentID]) REFERENCES [ref].[WaterQualityInstrument] ([ID]),
    CONSTRAINT [FK_WaterQualityActivity_SpCondInstrument] FOREIGN KEY ([SpCondInstrumentID]) REFERENCES [ref].[WaterQualityInstrument] ([ID]),
    CONSTRAINT [FK_WaterQualityActivity_TemperatureInstrument] FOREIGN KEY ([TemperatureInstrumentID]) REFERENCES [ref].[WaterQualityInstrument] ([ID]),
    CONSTRAINT [FK_WaterQualityActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID]),
    CONSTRAINT [FK_WaterQualityActivity_WaterQualityDataCollected] FOREIGN KEY ([WaterQualityDataCollectedID]) REFERENCES [lookup].[WaterQualityDataCollected] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_WaterQualityActivity_VisitID]
    ON [data].[WaterQualityActivity]([VisitID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General information about water quality measurements', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.SufficientWater (indicates whether the amount of water at the spring was sufficient for wq measurements)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'WaterQualityDataCollectedID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WaterQualityInstrument (instrument used for measurement)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'pHInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WaterQualityInstrument (instrument used for measurement)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'DOInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WaterQualityInstrument (instrument used for measurement)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'SpCondInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WaterQualityInstrument (instrument used for measurement)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'TemperatureInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Not in use', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataProcessingLevel (indicates level of qa/qc that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note for Data Processing Level status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WaterQualityActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';

