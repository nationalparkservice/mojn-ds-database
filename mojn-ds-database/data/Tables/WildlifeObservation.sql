CREATE TABLE [data].[WildlifeObservation] (
    [ID]                 INT           IDENTITY (1, 1) NOT NULL,
    [WildlifeActivityID] INT           NOT NULL,
    [WildlifeTypeID]     TINYINT       NOT NULL,
    [DirectObservation] TINYINT NOT NULL, 
    [Scat] TINYINT NOT NULL, 
    [Tracks] TINYINT NOT NULL, 
    [Shelter] TINYINT NOT NULL, 
    [Foraging] TINYINT NOT NULL, 
    [Vocalization] TINYINT NOT NULL, 
    [OtherEvidence] TINYINT NOT NULL,
	[Notes]      VARCHAR (500) NULL,
    [DateCreated]        DATETIME2 (0) CONSTRAINT [DF_WildlifeObservation_DateCreated] DEFAULT (getdate()) NOT NULL, 
    CONSTRAINT [PK_WildlifeObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WildlifeObservation_EvidenceNotes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_WildlifeObservation_WildlifeActivity] FOREIGN KEY ([WildlifeActivityID]) REFERENCES [data].[WildlifeActivity] ([ID]),
    CONSTRAINT [FK_WildlifeObservation_DirectObservation] FOREIGN KEY ([DirectObservation]) REFERENCES [lookup].[WildlifeEvidencePresent] ([ID]),
    CONSTRAINT [FK_WildlifeObservation_Scat] FOREIGN KEY ([Scat]) REFERENCES [lookup].[WildlifeEvidencePresent] ([ID]),
	CONSTRAINT [FK_WildlifeObservation_Tracks] FOREIGN KEY ([Tracks]) REFERENCES [lookup].[WildlifeEvidencePresent] ([ID]),
	CONSTRAINT [FK_WildlifeObservation_Shelter] FOREIGN KEY ([Shelter]) REFERENCES [lookup].[WildlifeEvidencePresent] ([ID]),
	CONSTRAINT [FK_WildlifeObservation_Foraging] FOREIGN KEY ([Foraging]) REFERENCES [lookup].[WildlifeEvidencePresent] ([ID]),
	CONSTRAINT [FK_WildlifeObservation_Vocalization] FOREIGN KEY ([Vocalization]) REFERENCES [lookup].[WildlifeEvidencePresent] ([ID]),
	CONSTRAINT [FK_WildlifeObservation_OtherEvidence] FOREIGN KEY ([OtherEvidence]) REFERENCES [lookup].[WildlifeEvidencePresent] ([ID]),
	CONSTRAINT [FK_WildlifeObservation_WildlifeType] FOREIGN KEY ([WildlifeTypeID]) REFERENCES [lookup].[WildlifeType] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_WildlifeObservation_WildlifeActivityID_WildlifeTypeID]
    ON [data].[WildlifeObservation]([WildlifeActivityID] ASC, [WildlifeTypeID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Wildlife observed at spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.WildlifeActivity (general wildlife information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'WildlifeActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeType (broad wildlife categories of interest)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'WildlifeTypeID';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidencePresent indicating whether a direct observation was made of the specified wildilfe type', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'DirectObservation';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidencePresent indicating whether scat from the specified wildilfe type was found', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'Scat';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidencePresent indicating whether tracks from the specified wildilfe type were found', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'Tracks';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidencePresent indicating whether shelter/burrows from the specified wildilfe type were found', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'Shelter';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidencePresent indicating whether foraging from the specified wildilfe type was found', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'Foraging';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidencePresent indicating whether vocalization from the specified wildilfe type was heard', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'Vocalization';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.WildlifeEvidencePresent indicating whether other evidence from the specified wildilfe type was found', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'OtherEvidence';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes pertaining to wildlife evidence', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = 'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'WildlifeObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

