CREATE TABLE [app].[ConfigurationVariable] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Label]       VARCHAR (30)  NOT NULL,
    [Value]       VARCHAR (200) NOT NULL,
    [Description] VARCHAR (200) NULL,
    CONSTRAINT [PK_ConfigurationVariable] PRIMARY KEY CLUSTERED ([ID] ASC)
);

