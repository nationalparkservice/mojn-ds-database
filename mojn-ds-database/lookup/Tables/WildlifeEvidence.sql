CREATE TABLE [lookup].[WildlifeEvidence] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (6)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_WildlifeEvidence] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WildlifeEvidence_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_WildlifeEvidence_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_WildlifeEvidence_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_WildlifeEvidence_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Types of evidence of wildlife presence', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidence';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidence', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidence', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidence', @level2type = N'COLUMN', @level2name = N'Label';

