CREATE TABLE [data].[WildlifeObservation] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [WildlifeActivityID] INT           NOT NULL,
    [WildlifeTypeID]     TINYINT       NOT NULL,
    [SpeciesName]        VARCHAR (50)  NULL,
    [WildlifeEvidenceID] TINYINT       NOT NULL,
    [EvidenceNotes]      VARCHAR (500) NULL,
    [DateCreated]        DATETIME2 (0) CONSTRAINT [DF_WildlifeObservation_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_WildlifeObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WildlifeObservation_EvidenceNotes_DisallowZeroLength] CHECK (len([EvidenceNotes])>(0)),
    CONSTRAINT [CK_WildlifeObservation_SpeciesName_DisallowZeroLength] CHECK (len([SpeciesName])>(0)),
    CONSTRAINT [FK_WildlifeObservation_WildlifeActivity] FOREIGN KEY ([WildlifeActivityID]) REFERENCES [data].[WildlifeActivity] ([ID]),
    CONSTRAINT [FK_WildlifeObservation_WildlifeEvidence] FOREIGN KEY ([WildlifeEvidenceID]) REFERENCES [lookup].[WildlifeEvidence] ([ID]),
    CONSTRAINT [FK_WildlifeObservation_WildlifeType] FOREIGN KEY ([WildlifeTypeID]) REFERENCES [lookup].[WildlifeType] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_WildlifeObservation_WildlifeActivityID_WildlifeTypeID_SpeciesName_WildlifeEvidenceID_EvidenceNotes]
    ON [data].[WildlifeObservation]([WildlifeActivityID] ASC, [WildlifeTypeID] ASC, [SpeciesName] ASC, [WildlifeEvidenceID] ASC, [EvidenceNotes] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Wildlife observed at spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.WildlifeEvent (general wildlife information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'WildlifeActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeType (broad wildlife categories of interest)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'WildlifeTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of wildlife (may be scientific or common name)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'SpeciesName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidence (types of evidence of wildlife presence)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'WildlifeEvidenceID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes pertaining to wildlife evidence', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'EvidenceNotes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

