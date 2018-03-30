CREATE TABLE [lookup].[FlowModificationStatus] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (10) NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_FlowModificationStatus] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_FlowModificationStatus_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_FlowModificationStatus_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_FlowModificationStatus_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_FlowModificationStatus_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether spring flow has been modified from its natural course', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowModificationStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowModificationStatus', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowModificationStatus', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowModificationStatus', @level2type = N'COLUMN', @level2name = N'Label';

