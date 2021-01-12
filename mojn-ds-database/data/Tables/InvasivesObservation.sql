CREATE TABLE [data].[InvasivesObservation] (
    [ID]                            INT             IDENTITY (1, 1) NOT NULL,
    [InvasivesActivityID]           INT             NOT NULL,
    [TaxonID]                       INT             NOT NULL,
    [SpeciesNotes]                  VARCHAR (100)   NULL,
    [RiparianVegetationBufferID]    TINYINT         NOT NULL,
    [UtmX_m]                        DECIMAL (8, 2)  NULL,
    [UtmY_m]                        DECIMAL (9, 2)  NULL,
    [HorizontalDatumID]             TINYINT         NULL,
    [UTMZoneID]                     TINYINT         NULL,
    [GPSUnitID]                     TINYINT         NULL,
    [ProtectedStatusID]             TINYINT         NOT NULL,
    [TaxonomicReferenceAuthorityID] INT             NOT NULL,
    [DateCreated]                   DATETIME2 (0)   CONSTRAINT [DF_InvasivesObservation_DateCreated] DEFAULT (getdate()) NOT NULL,
    [GpsX]                          DECIMAL (13, 8) NULL,
    [GpsY]                          DECIMAL (13, 8) NULL,
    CONSTRAINT [PK_InvasivesObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_InvasivesObservation_SpeciesNotes_DisallowZeroLength] CHECK (len([SpeciesNotes])>(0)),
    CONSTRAINT [CK_InvasivesObservation_UtmX_m] CHECK ([UtmX_m]>=(200000) AND [UtmX_m]<=(900000)),
    CONSTRAINT [CK_InvasivesObservation_UtmY_m] CHECK ([UtmY_m]>=(3500000) AND [UtmY_m]<=(4350000)),
    CONSTRAINT [FK_InvasivesObservation_HorizontalDatum] FOREIGN KEY ([HorizontalDatumID]) REFERENCES [lookup].[HorizontalDatum] ([ID]),
    CONSTRAINT [FK_InvasivesObservation_InvasivesActivity] FOREIGN KEY ([InvasivesActivityID]) REFERENCES [data].[InvasivesActivity] ([ID]),
    CONSTRAINT [FK_InvasivesObservation_ProtectedStatus] FOREIGN KEY ([ProtectedStatusID]) REFERENCES [lookup].[ProtectedStatus] ([ID]),
    CONSTRAINT [FK_InvasivesObservation_RiparianVegetationBuffer] FOREIGN KEY ([RiparianVegetationBufferID]) REFERENCES [lookup].[RiparianVegetationBuffer] ([ID]),
    CONSTRAINT [FK_InvasivesObservation_Taxon] FOREIGN KEY ([TaxonID]) REFERENCES [ref].[Taxon] ([ID]),
    CONSTRAINT [FK_InvasivesObservation_TaxonomicReferenceAuthority] FOREIGN KEY ([TaxonomicReferenceAuthorityID]) REFERENCES [lookup].[TaxonomicReferenceAuthority] ([ID]),
    CONSTRAINT [FK_InvasivesObservation_UTMZone] FOREIGN KEY ([UTMZoneID]) REFERENCES [lookup].[UTMZone] ([ID])
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Invasive species found at site', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.InvasivesEvent (general invasives information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'InvasivesActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.Taxon (species list)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'TaxonID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about this plant', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'SpeciesNotes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.RiparianVegetationBuffer (indicates whether invasive species observation falls within or outside of riparian veg buffer)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'RiparianVegetationBufferID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM X coordinate for Invasives Observation', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'UtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Y coordinate for Invasives Observation', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'UtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.HorizontalDatum (horizontal datum of UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'HorizontalDatumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.UTMZone (zone associated with utm coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'UTMZoneID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.ProtectedStatus (protected status of data record)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'ProtectedStatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.TaxonomicReferenceAuthority (reference or authority used in species identification)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'TaxonomicReferenceAuthorityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'InvasivesObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

