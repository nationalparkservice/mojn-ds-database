CREATE TABLE [lookup].[WildlifeType] (
    [ID]       TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]     VARCHAR (6)  NOT NULL,
    [Label]    VARCHAR (25) NOT NULL,
    [IsActive] BIT          CONSTRAINT [DF_WildlifeType_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_WildlifeTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WildlifeType_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_WildlifeType_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_WildlifeType_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_WildlifeType_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_WildlifeTypes_Code]
    ON [lookup].[WildlifeType]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_WildlifeTypes_Label]
    ON [lookup].[WildlifeType]([Label] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Broad wildlife categories of interest', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType', @level2type = N'COLUMN', @level2name = N'Label';

