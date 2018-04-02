CREATE TABLE [lookup].[LifeForm] (
    [ID]       TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]    VARCHAR (15)  NOT NULL,
    [Summary]  VARCHAR (500) NULL,
    [Code]     VARCHAR (15)  NOT NULL,
    [IsActive] BIT           CONSTRAINT [DF_LifeForm_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_LifeForm] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_LifeForm_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_LifeForm_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_LifeForm_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_LifeForm_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_LifeForm_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of riparian vegetation, split into broad and easily identifiable classes', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'Code';

