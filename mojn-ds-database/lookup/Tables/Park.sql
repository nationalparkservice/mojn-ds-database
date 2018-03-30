CREATE TABLE [lookup].[Park] (
    [ID]         TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]       VARCHAR (10) NOT NULL,
    [Label]      VARCHAR (50) NOT NULL,
    [ShortLabel] VARCHAR (40) NOT NULL,
    CONSTRAINT [PK_Park] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_LandManagementUnit_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_LandManagementUnit_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_LandManagementUnit_ShortLabel_DisallowZeroLength] CHECK (len([ShortLabel])>(0)),
    CONSTRAINT [CK_Park_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_Park_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_Park_ShortLabel_DisallowZeroLength] CHECK (len([ShortLabel])>(0)),
    CONSTRAINT [UN_Park_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_Park_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The park in which the spring is located', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shortened label (abbreviates National Park to NP, etc.)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Park', @level2type = N'COLUMN', @level2name = N'ShortLabel';

