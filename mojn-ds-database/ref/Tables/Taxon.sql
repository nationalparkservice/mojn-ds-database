CREATE TABLE [ref].[Taxon] (
    [ID]                            INT           IDENTITY (1, 1) NOT NULL,
    [USDAPlantsCode]                VARCHAR (10)  NOT NULL,
    [ScientificName]                VARCHAR (50)  NOT NULL,
    [CommonName]                    VARCHAR (50)  NOT NULL,
    [Invasive]                      BIT           NULL,
    [TaxonomicReferenceAuthorityID] INT           NOT NULL,
    [DateCreated]                   DATETIME2 (0) CONSTRAINT [DF_Species_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Taxon_CommonName_DisallowZeroLength] CHECK (len([CommonName])>(0)),
    CONSTRAINT [CK_Taxon_ScientificName_DisallowZeroLength] CHECK (len([ScientificName])>(0)),
    CONSTRAINT [CK_Taxon_USDAPlantsCode_DisallowZeroLength] CHECK (len([USDAPlantsCode])>(0)),
    CONSTRAINT [FK_Taxon_TaxonomicReferenceAuthority] FOREIGN KEY ([TaxonomicReferenceAuthorityID]) REFERENCES [lookup].[TaxonomicReferenceAuthority] ([ID]),
    CONSTRAINT [UN_Taxon_USDAPlantsCode] UNIQUE NONCLUSTERED ([USDAPlantsCode] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Species list', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'USDA plant code assigned to taxon', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'USDAPlantsCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Species scientific name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'ScientificName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Species common name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'CommonName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether species is considered invasive', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'Invasive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.TaxonomicReferenceAuthority (reference or authority used in species identification)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'TaxonomicReferenceAuthorityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'DateCreated';

