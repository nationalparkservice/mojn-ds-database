CREATE TABLE [data].[RiparianVegetationObservation] (
    [ID]                            INT           IDENTITY (1, 1) NOT NULL,
    [RiparianVegetationActivityID]  INT           NOT NULL,
    [LifeFormID]                    TINYINT       NOT NULL,
    [Rank]                          TINYINT       NOT NULL,
    [DominantSpecies]               VARCHAR (50)  NULL,
    [TaxonID]                       INT           NULL,
    [ProtectedStatusID]             TINYINT       NULL,
    [TaxonomicReferenceAuthorityID] INT           NULL,
    [DateCreated]                   DATETIME2 (0) CONSTRAINT [DF_RiparianVegetationObservation_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RiparianVegetationObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_RiparianVegetationObservation_DominantSpecies_DisallowZeroLength] CHECK (len([DominantSpecies])>(0)),
    CONSTRAINT [CK_RiparianVegetationObservation_Rank] CHECK ([Rank]>=(1) AND [Rank]<=(12)),
    CONSTRAINT [FK_RiparianVegetationObservation_LifeForm] FOREIGN KEY ([LifeFormID]) REFERENCES [lookup].[LifeForm] ([ID]),
    CONSTRAINT [FK_RiparianVegetationObservation_ProtectedStatus] FOREIGN KEY ([ProtectedStatusID]) REFERENCES [lookup].[ProtectedStatus] ([ID]),
    CONSTRAINT [FK_RiparianVegetationObservation_RiparianVegetationActivity] FOREIGN KEY ([RiparianVegetationActivityID]) REFERENCES [data].[RiparianVegetationActivity] ([ID]),
    CONSTRAINT [FK_RiparianVegetationObservation_Taxon] FOREIGN KEY ([TaxonID]) REFERENCES [ref].[Taxon] ([ID]),
    CONSTRAINT [FK_RiparianVegetationObservation_TaxonomicReferenceAuthority] FOREIGN KEY ([TaxonomicReferenceAuthorityID]) REFERENCES [lookup].[TaxonomicReferenceAuthority] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiparianVegetationObservation_RiparianVegetationActivityID_LifeFormID]
    ON [data].[RiparianVegetationObservation]([RiparianVegetationActivityID] ASC, [LifeFormID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Observations of riparian vegetation, classified by lifeform and relative abundance', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.RiparianVegetationEvent (overview of riparian vegetation)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'RiparianVegetationActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.LifeForm (type of riparian vegetation, split into broad and easily identifiable classes)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'LifeFormID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Integer indicating relative canopy cover of vegetation life form. 1 indicates greatest canopy cover. Ties are allowed.', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'Rank';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Text description or name of the dominant species', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'DominantSpecies';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.Taxon (species list)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'TaxonID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.ProtectedStatus (protected status of data record)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'ProtectedStatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.TaxonomicReferenceAuthority (reference or authority used in species identification)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'TaxonomicReferenceAuthorityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

