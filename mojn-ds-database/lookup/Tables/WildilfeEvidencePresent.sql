CREATE TABLE [lookup].[WildlifeEvidencePresent] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (6)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_WildlifeEvidencePresent] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether a specific wildilfe evidence type was found at the spring', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidencePresent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidencePresent', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique code for wildlife evidence presence', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidencePresent', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique name for wildlife evidence presence', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeEvidencePresent', @level2type = N'COLUMN', @level2name = N'Label';

