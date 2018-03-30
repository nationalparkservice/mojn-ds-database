CREATE TABLE [lookup].[DisturbanceClass] (
    [ID]    TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]  VARCHAR (10) NOT NULL,
    [Label] VARCHAR (15) NOT NULL,
    CONSTRAINT [PK_DisturbanceActivityClass] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DisturbanceActivityClass_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_DisturbanceActivityClass_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_DisturbanceActivityActivityClass_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_DisturbanceActivityActivityClass_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Disturbance cover classes', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceClass';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceClass', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceClass', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'DisturbanceClass', @level2type = N'COLUMN', @level2name = N'Label';

