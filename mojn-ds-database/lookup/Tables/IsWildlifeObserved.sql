CREATE TABLE [lookup].[IsWildlifeObserved] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (6)  NOT NULL,
    [Label] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_IsWildlifeObserved] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether evidence of wildlife was observed at a spring', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsWildlifeObserved';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsWildlifeObserved', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique code for wildlife evidence', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsWildlifeObserved', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique name for wildlife evidence lookup', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsWildlifeObserved', @level2type = N'COLUMN', @level2name = N'Label';

