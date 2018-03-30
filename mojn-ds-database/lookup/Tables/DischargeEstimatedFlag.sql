CREATE TABLE [lookup].[DischargeEstimatedFlag] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (5)  NOT NULL,
    [Label] VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_DischargeEstimatedFlag] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DischargeEstimatedFlag_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_DischargeEstimatedFlag_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_EstimatedDischargeFlag_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_EstimatedDischargeFlag_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_DischargeEstimatedFlag_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_DischargeEstimatedFlag_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether estimated discharge is less than the reported value', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[tlu_EstimatedDischargeFlag]', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[tlu_EstimatedDischargeFlag].[ID]', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[tlu_EstimatedDischargeFlag].[Code]', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[tlu_EstimatedDischargeFlag].[Label]', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[tlu_EstimatedDischargeFlag].[PrimaryKey]', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DischargeEstimatedFlag', @level2type = N'CONSTRAINT', @level2name = N'PK_DischargeEstimatedFlag';

