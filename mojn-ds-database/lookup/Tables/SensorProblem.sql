CREATE TABLE [lookup].[SensorProblem] (
    [ID]      TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]   VARCHAR (25)  NOT NULL,
    [Summary] VARCHAR (100) NOT NULL,
    CONSTRAINT [PK_SensorProblem] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SensorProblem_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_SensorProblem_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_SensorProblem_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Problems with retrieved sensor', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SensorProblem';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SensorProblem', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SensorProblem', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'SensorProblem', @level2type = N'COLUMN', @level2name = N'Summary';

