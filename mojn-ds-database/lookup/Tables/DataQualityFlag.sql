CREATE TABLE [lookup].[DataQualityFlag] (
    [ID]        TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]      VARCHAR (5)   NOT NULL,
    [Label]     VARCHAR (25)  NOT NULL,
    [Summary]   VARCHAR (200) NULL,
    [IsActive]  BIT           NOT NULL,
    [SortOrder] TINYINT       NOT NULL,
    CONSTRAINT [PK_DataQualityFlag] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DataQualityFlag_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_DataQualityFlag_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_DataQualityFlag_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_DataQualityFlag_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_DataQualityFlag_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates type and severity of data quality issue', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataQualityFlag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataQualityFlag', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataQualityFlag', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataQualityFlag', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataQualityFlag', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this item is a valid option for current data', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataQualityFlag', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort order for items in this lookup', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DataQualityFlag', @level2type = N'COLUMN', @level2name = N'SortOrder';

