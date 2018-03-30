CREATE TABLE [lookup].[FlowCondition] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Label] VARCHAR (50) NOT NULL,
    [Sort]  TINYINT      NULL,
    CONSTRAINT [PK_FlowCondition] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_FlowCondition_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_FlowCondition_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flow condition at time of site visit', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowCondition';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowCondition', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowCondition', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sort order for items in this lookup', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'FlowCondition', @level2type = N'COLUMN', @level2name = N'Sort';

