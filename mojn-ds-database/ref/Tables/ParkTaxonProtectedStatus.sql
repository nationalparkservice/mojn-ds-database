CREATE TABLE [ref].[ParkTaxonProtectedStatus] (
    [TaxonID]           INT     NOT NULL,
    [ParkID]            TINYINT NOT NULL,
    [ProtectedStatusID] TINYINT NOT NULL,
    CONSTRAINT [PK_ParkTaxonProtectedStatus] PRIMARY KEY CLUSTERED ([TaxonID] ASC, [ParkID] ASC),
    CONSTRAINT [FK_ParkTaxonProtectedStatus_Park] FOREIGN KEY ([ParkID]) REFERENCES [lookup].[Park] ([ID]),
    CONSTRAINT [FK_ParkTaxonProtectedStatus_ProtectedStatus] FOREIGN KEY ([ProtectedStatusID]) REFERENCES [lookup].[ProtectedStatus] ([ID]),
    CONSTRAINT [FK_ParkTaxonProtectedStatus_Taxon] FOREIGN KEY ([TaxonID]) REFERENCES [ref].[Taxon] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Cross-reference indicating protected level of species by park', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'ParkTaxonProtectedStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.Taxon (species list)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'ParkTaxonProtectedStatus', @level2type = N'COLUMN', @level2name = N'TaxonID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.Park (the park in which the spring is located)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'ParkTaxonProtectedStatus', @level2type = N'COLUMN', @level2name = N'ParkID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.ProtectedStatus (protected status of data record)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'ParkTaxonProtectedStatus', @level2type = N'COLUMN', @level2name = N'ProtectedStatusID';

