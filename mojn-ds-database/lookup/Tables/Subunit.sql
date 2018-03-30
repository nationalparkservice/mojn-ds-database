CREATE TABLE [lookup].[Subunit] (
    [ID]      SMALLINT      IDENTITY (1, 1) NOT NULL,
    [ParkID]  TINYINT       NOT NULL,
    [Code]    VARCHAR (6)   NOT NULL,
    [Label]   VARCHAR (100) NOT NULL,
    [Summary] VARCHAR (200) NULL,
    CONSTRAINT [PK_Subunit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Subunit_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_Subunit_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_Subunit_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [FK_Subunit_Park] FOREIGN KEY ([ParkID]) REFERENCES [lookup].[Park] ([ID]),
    CONSTRAINT [UN_Subunit_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_Subunit_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Management units into which parks are subdivided', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Subunit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Subunit', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.Park (the park in which the spring is located)', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Subunit', @level2type = N'COLUMN', @level2name = N'ParkID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Subunit', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Subunit', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'Subunit', @level2type = N'COLUMN', @level2name = N'Summary';

