CREATE TABLE [lookup].[GRTSPanel] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (10) NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_GRTSPanel] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_GRTSPanel_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_GRTSPanel_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_GRTSPanel_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_GRTSPanel_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Documents the GRTS sampling panel applied to this location.', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GRTSPanel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GRTSPanel', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GRTSPanel', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'GRTSPanel', @level2type = N'COLUMN', @level2name = N'Label';

