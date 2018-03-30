CREATE TABLE [lookup].[PersonnelRole] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]   VARCHAR (50)  NOT NULL,
    [Summary] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_PersonnelRole] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PersonnelRole_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_PersonnelRole_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_PersonnelRole_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Data management roles, from collection to QA/QC and certification', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'PersonnelRole', @level2type = N'COLUMN', @level2name = N'Summary';

