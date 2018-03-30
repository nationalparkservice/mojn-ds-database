CREATE TABLE [data].[Visit] (
    [ID]                      INT           IDENTITY (1, 1) NOT NULL,
    [SiteID]                  INT           NOT NULL,
    [VisitDate]               DATETIME2 (0) NOT NULL,
    [StartTime]               DATETIME2 (0) NULL,
    [Notes]                   VARCHAR (750) NULL,
    [SpringTypeID]            TINYINT       NULL,
    [VisitTypeID]             TINYINT       NOT NULL,
    [QAQCNotes]               VARCHAR (200) NULL,
    [MonitoringStatusID]      TINYINT       NOT NULL,
    [ProtocolID]              TINYINT       NOT NULL,
    [ProtectedStatusID]       TINYINT       NULL,
    [DataReviewNotes]         VARCHAR (400) NULL,
    [DataProcessingLevelID]   TINYINT       CONSTRAINT [DF_Visit_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate] DATETIME2 (0) CONSTRAINT [DF_Visit_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote] VARCHAR (500) NULL,
    [DateCreated]             DATETIME2 (0) CONSTRAINT [DF_Visit_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Visit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Visit_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_Visit_DataReviewNotes_DisallowZeroLength] CHECK (len([DataReviewNotes])>(0)),
    CONSTRAINT [CK_Visit_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Visit_QAQCNotes_DisallowZeroLength] CHECK (len([QAQCNotes])>(0)),
    CONSTRAINT [CK_Visit_VisitDate_range] CHECK ([VisitDate]>='1/1/2000' AND [VisitDate]<=CONVERT([datetime],CONVERT([varchar],getdate(),(1)),(1))),
    CONSTRAINT [FK_Visit_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_Visit_MonitoringStatus] FOREIGN KEY ([MonitoringStatusID]) REFERENCES [lookup].[MonitoringStatus] ([ID]),
    CONSTRAINT [FK_Visit_ProtectedStatus] FOREIGN KEY ([ProtectedStatusID]) REFERENCES [lookup].[ProtectedStatus] ([ID]),
    CONSTRAINT [FK_Visit_Protocol] FOREIGN KEY ([ProtocolID]) REFERENCES [ref].[Protocol] ([ID]),
    CONSTRAINT [FK_Visit_Site] FOREIGN KEY ([SiteID]) REFERENCES [data].[Site] ([ID]),
    CONSTRAINT [FK_Visit_SpringType] FOREIGN KEY ([SpringTypeID]) REFERENCES [lookup].[SpringType] ([ID]),
    CONSTRAINT [FK_Visit_VisitType] FOREIGN KEY ([VisitTypeID]) REFERENCES [lookup].[VisitType] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Visit_SiteID_VisitTypeID_VisitDate]
    ON [data].[Visit]([SiteID] ASC, [VisitTypeID] ASC, [VisitDate] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Information about individual sampling visits', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Site (the springs contained in the sampling frame)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'SiteID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of spring visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'VisitDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Start time of spring visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'StartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'General comments pertaining to spring visit', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.SpringType (hydrologic category of spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'SpringTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.SpringVisitType (type of site visit)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'VisitTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes for QA/QC', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'QAQCNotes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.AcceptanceRejectionReason (reason spring was accepted or rejected)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'MonitoringStatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.Protocol (reference to each version of the monitoring protocol)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'ProtocolID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Comments for Data Review', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DataReviewNotes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataProcessingLevel (indicates level of qa/qc that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Visit', @level2type = N'COLUMN', @level2name = N'DateCreated';

