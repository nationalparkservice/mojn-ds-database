CREATE TABLE [lookup].[TaxonomicReferenceAuthority] (
    [ID]                  INT           IDENTITY (1, 1) NOT NULL,
    [TaxonomicStandardID] TINYINT       NOT NULL,
    [Label]               VARCHAR (40)  NOT NULL,
    [Summary]             VARCHAR (500) NOT NULL,
    CONSTRAINT [PK_TaxonomicReferenceAuthority] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_TaxonomicReferenceAuthority_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_TaxonomicReferenceAuthority_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [FK_TaxonomicReferenceAuthority_TaxonomicStandard] FOREIGN KEY ([TaxonomicStandardID]) REFERENCES [lookup].[TaxonomicStandard] ([ID]),
    CONSTRAINT [UN_TaxonomicReferenceAuthority_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_TaxonomicReferenceAuthority_Identification_Label]
    ON [lookup].[TaxonomicReferenceAuthority]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reference or authority used in species identification', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.TaxonomicStandard (type of standard used in species identification)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'TaxonomicStandardID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For Scientific Publications, use unique short alphanumeric citation that includes abbreviated authors and year of publication (e.g., Welsh et al.2003). For Taxonomic Subject Matter Experts, use shortened name and organization (e.g., J. Doe, UGA). For Field Subject Matter Experts, use shortened position responsible for performing identifications (e.g., crew lead w/ID skill).', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'For Scientific Publications, use complete and unique citiation (e.g., Welsh, S.L., N.D. Atwood, S. Goodrich, and L.C. Higgins. 2003. A Utah flora. Third edition, revised. Provo, UT.:Brigham Young University. 912 pp.) For Taxonomic Subject Matter Experts, use full name and organization (e.g., John Doe, University of Georgia). For Field Subject Matter Experts, use full position responsible for performing identifications (e.g., field crew lead with documented identification proficiency).', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicReferenceAuthority', @level2type = N'COLUMN', @level2name = N'Summary';

