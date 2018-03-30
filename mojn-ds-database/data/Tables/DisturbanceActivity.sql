CREATE TABLE [data].[DisturbanceActivity] (
    [ID]                       INT            IDENTITY (1, 1) NOT NULL,
    [VisitID]                  INT            NOT NULL,
    [FlowModificationStatusID] TINYINT        NOT NULL,
    [Roads]                    TINYINT        NOT NULL,
    [HumanUse]                 TINYINT        NOT NULL,
    [PlantManagement]          TINYINT        NOT NULL,
    [HikingTrails]             TINYINT        NOT NULL,
    [Livestock]                TINYINT        NOT NULL,
    [OtherAnthropogenic]       TINYINT        NOT NULL,
    [Fire]                     TINYINT        NOT NULL,
    [Flooding]                 TINYINT        NOT NULL,
    [Wildlife]                 TINYINT        NOT NULL,
    [OtherNatural]             TINYINT        NOT NULL,
    [Overall]                  TINYINT        NOT NULL,
    [Notes]                    VARCHAR (1000) NULL,
    [DataProcessingLevelID]    TINYINT        CONSTRAINT [DF_DisturbanceActivity_DataProcessingLevelID] DEFAULT ((1)) NOT NULL,
    [DataProcessingLevelDate]  DATETIME2 (0)  CONSTRAINT [DF_DisturbanceActivity_DataProcessingLevelDate] DEFAULT (getdate()) NOT NULL,
    [DataProcessingLevelNote]  VARCHAR (400)  NULL,
    [DateCreated]              DATETIME2 (0)  CONSTRAINT [DF_DisturbanceActivity_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_DisturbanceActivity] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_DisturbanceActivity_DataProcessingLevelNote_DisallowZeroLength] CHECK (len([DataProcessingLevelNote])>(0)),
    CONSTRAINT [CK_DisturbanceActivity_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [FK_DisturbanceActivity_DataProcessingLevel] FOREIGN KEY ([DataProcessingLevelID]) REFERENCES [lookup].[DataProcessingLevel] ([ID]),
    CONSTRAINT [FK_DisturbanceActivity_FlowModificationStatus] FOREIGN KEY ([FlowModificationStatusID]) REFERENCES [lookup].[FlowModificationStatus] ([ID]),
    CONSTRAINT [FK_DisturbanceActivity_Visit] FOREIGN KEY ([VisitID]) REFERENCES [data].[Visit] ([ID]),
    CONSTRAINT [FK_FireDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([Fire]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_FloodingDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([Flooding]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_HikingTrailsDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([HikingTrails]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_HumanUseDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([HumanUse]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_LivestockDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([Livestock]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_OtherAnthroDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([OtherAnthropogenic]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_OtherNaturalDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([OtherNatural]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_OverallDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([Overall]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_PlantMgmtDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([PlantManagement]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_RoadsDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([Roads]) REFERENCES [lookup].[DisturbanceClass] ([ID]),
    CONSTRAINT [FK_WildlifeDisturbanceActivity_DisturbanceActivityClass] FOREIGN KEY ([Wildlife]) REFERENCES [lookup].[DisturbanceClass] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_DisturbanceActivity_VisitID]
    ON [data].[DisturbanceActivity]([VisitID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Disturbance observed at spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Visit (information about individual sampling visits)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'VisitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.FlowModificationStatus (indicates whether spring flow has been modified from its natural course)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'FlowModificationStatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Road disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'Roads';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Human use disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'HumanUse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Plant management disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'PlantManagement';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Hiking trail disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'HikingTrails';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Livestock disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'Livestock';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Other anthropogenic disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'OtherAnthropogenic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Fire disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'Fire';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Flooding disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'Flooding';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Wildlife disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'Wildlife';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Other natural disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'OtherNatural';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Overall disturbance percent class from lookup.DisturbanceClass', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'Overall';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional notes about disturbance at this location', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.DataProcessingLevel (indicates level of qa/qc that has been applied to data in a given table)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Data Processing Level was changed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Note for Data Processing Level Status', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'DataProcessingLevelNote';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'DisturbanceActivity', @level2type = N'COLUMN', @level2name = N'DateCreated';

