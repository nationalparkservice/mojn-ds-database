CREATE TABLE [lookup].[TaxonomicStandard] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]    VARCHAR (5)   NOT NULL,
    [Label]   VARCHAR (40)  NOT NULL,
    [Summary] VARCHAR (300) NOT NULL,
    CONSTRAINT [PK_TaxonomicStandard] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_TaxonomicStandard_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_TaxonomicStandard_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_TaxonomicStandard_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_TaxonomicStandard_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_TaxonomicStandard_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of standard used in species identification', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicStandard';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicStandard', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicStandard', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicStandard', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'TaxonomicStandard', @level2type = N'COLUMN', @level2name = N'Summary';

