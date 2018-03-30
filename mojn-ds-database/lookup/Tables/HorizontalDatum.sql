CREATE TABLE [lookup].[HorizontalDatum] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]    VARCHAR (20)  NOT NULL,
    [Label]   VARCHAR (100) NOT NULL,
    [Summary] VARCHAR (200) NULL,
    CONSTRAINT [PK_HorizontalDatum] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_HorizontalDatum_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_HorizontalDatum_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_HorizontalDatum_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_HorizontalDatum_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_HorizontalDatum_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Horizontal datum of UTM coordinates', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'HorizontalDatum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'HorizontalDatum', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'HorizontalDatum', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'HorizontalDatum', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'HorizontalDatum', @level2type = N'COLUMN', @level2name = N'Summary';

