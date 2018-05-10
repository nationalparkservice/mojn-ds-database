CREATE TABLE [lookup].[MonitoringStatus] (
    [ID]                 TINYINT       IDENTITY (1, 1) NOT NULL,
    [Code]               VARCHAR (5)   NOT NULL,
    [IsSampled] VARCHAR (10)  NOT NULL,
    [Label]              VARCHAR (35)  NOT NULL,
    [Summary]            VARCHAR (200) NOT NULL,
    CONSTRAINT [PK_MonitoringStatus] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_MonitoringStatus_IsSampled_DisallowZeroLength] CHECK (len([IsSampled])>(0)),
    CONSTRAINT [CK_MonitoringStatus_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_MonitoringStatus_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_MonitoringStatus_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_MonitoringStatus_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_MonitoringStatus_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Reason spring was accepted or rejected', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'MonitoringStatus';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'MonitoringStatus', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique code for Acceptance rejection reason lookup', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'MonitoringStatus', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Category name/description for acceptance rejection reason', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'MonitoringStatus', @level2type = N'COLUMN', @level2name = 'IsSampled';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'MonitoringStatus', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'MonitoringStatus', @level2type = N'COLUMN', @level2name = N'Summary';

