CREATE TABLE [lookup].[IsDownloadSuccessful] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_IsDownloadSuccessful] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_IsDownloadSuccessful_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_IsDownloadSuccessful_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_IsDownloadSuccessful_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_IsDownloadSuccessful_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether sensor data were downloaded successfully', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDownloadSuccessful';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDownloadSuccessful', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDownloadSuccessful', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'IsDownloadSuccessful', @level2type = N'COLUMN', @level2name = N'Label';

