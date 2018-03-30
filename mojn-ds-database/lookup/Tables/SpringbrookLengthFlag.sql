CREATE TABLE [lookup].[SpringbrookLengthFlag] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]    VARCHAR (10)  NOT NULL,
    [Label]   VARCHAR (50)  NOT NULL,
    [Summary] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_SpringbrookLengthFlag] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SpringbrookLengthFlag_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_SpringbrookLengthFlag_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_SpringbrookLengthFlag_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_SpringbrookLengthFlag_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_SpringbrookLengthFlag_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether springbrook length is greater than reported length', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SpringbrookLengthFlag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SpringbrookLengthFlag', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SpringbrookLengthFlag', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SpringbrookLengthFlag', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SpringbrookLengthFlag', @level2type = N'COLUMN', @level2name = N'Summary';

