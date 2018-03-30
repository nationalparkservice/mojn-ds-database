CREATE TABLE [data].[SensorImportHeader] (
    [ID]                       INT           IDENTITY (1, 1) NOT NULL,
    [SensorRetrievalAttemptID] INT           NOT NULL,
    [SensorModel]              VARCHAR (20)  NOT NULL,
    [SerialNumber]             VARCHAR (50)  NOT NULL,
    [MissionInProgress]        VARCHAR (10)  NOT NULL,
    [SUTAMission]              VARCHAR (10)  NOT NULL,
    [WaitingForTempAlarm]      VARCHAR (10)  NOT NULL,
    [SampleRate]               VARCHAR (50)  NOT NULL,
    [MissionStartTime]         VARCHAR (50)  NOT NULL,
    [MissionSampleCount]       INT           NOT NULL,
    [RolloverEnabled]          VARCHAR (50)  NOT NULL,
    [FirstSampleTimestamp]     VARCHAR (50)  NOT NULL,
    [TotalMissionSamples]      INT           NOT NULL,
    [TotalDeviceSamples]       INT           NOT NULL,
    [TemperatureLogging]       VARCHAR (10)  NOT NULL,
    [TemperatureHighAlarm]     VARCHAR (20)  NOT NULL,
    [TemperatureLowAlarm]      VARCHAR (20)  NOT NULL,
    [DataLogging]              VARCHAR (10)  NOT NULL,
    [DataHighAlarm]            VARCHAR (20)  NOT NULL,
    [DataLowAlarm]             VARCHAR (20)  NOT NULL,
    [IsImportSuccess]          BIT           NOT NULL,
    [ImportDate]               DATETIME2 (0) NOT NULL,
    [username]                 VARCHAR (100) NULL,
    CONSTRAINT [PK_SensorImportHeader] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SensorImportHeader_DataHighAlarm_DisallowZeroLength] CHECK (len([DataHighAlarm])>(0)),
    CONSTRAINT [CK_SensorImportHeader_DataLogging_DisallowZeroLength] CHECK (len([DataLogging])>(0)),
    CONSTRAINT [CK_SensorImportHeader_DataLowAlarm_DisallowZeroLength] CHECK (len([DataLowAlarm])>(0)),
    CONSTRAINT [CK_SensorImportHeader_FirstSampleTimestamp_DisallowZeroLength] CHECK (len([FirstSampleTimestamp])>(0)),
    CONSTRAINT [CK_SensorImportHeader_MissionInProgress_DisallowZeroLength] CHECK (len([MissionInProgress])>(0)),
    CONSTRAINT [CK_SensorImportHeader_MissionStartTime_DisallowZeroLength] CHECK (len([MissionStartTime])>(0)),
    CONSTRAINT [CK_SensorImportHeader_RolloverEnabled_DisallowZeroLength] CHECK (len([RolloverEnabled])>(0)),
    CONSTRAINT [CK_SensorImportHeader_SampleRate_DisallowZeroLength] CHECK (len([SampleRate])>(0)),
    CONSTRAINT [CK_SensorImportHeader_SensorModel_DisallowZeroLength] CHECK (len([SensorModel])>(0)),
    CONSTRAINT [CK_SensorImportHeader_SerialNumber_DisallowZeroLength] CHECK (len([SerialNumber])>(0)),
    CONSTRAINT [CK_SensorImportHeader_SUTAMission_DisallowZeroLength] CHECK (len([SUTAMission])>(0)),
    CONSTRAINT [CK_SensorImportHeader_TemperatureHighAlarm_DisallowZeroLength] CHECK (len([TemperatureHighAlarm])>(0)),
    CONSTRAINT [CK_SensorImportHeader_TemperatureLogging_DisallowZeroLength] CHECK (len([TemperatureLogging])>(0)),
    CONSTRAINT [CK_SensorImportHeader_TemperatureLowAlarm_DisallowZeroLength] CHECK (len([TemperatureLowAlarm])>(0)),
    CONSTRAINT [CK_SensorImportHeader_username_DisallowZeroLength] CHECK (len([username])>(0)),
    CONSTRAINT [CK_SensorImportHeader_WaitingForTempAlarm_DisallowZeroLength] CHECK (len([WaitingForTempAlarm])>(0)),
    CONSTRAINT [FK_SensorImportHeader_SensorRetrievalAttempt] FOREIGN KEY ([SensorRetrievalAttemptID]) REFERENCES [data].[SensorRetrievalAttempt] ([ID]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SensorImportHeader_SerialNumber_MissionStartTime]
    ON [data].[SensorImportHeader]([SerialNumber] ASC, [MissionStartTime] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Metadata associated with temperature and humidity data imported from iButton sensors', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.SensorRetrievalAttempt (information about attempts to retrieve ibutton humidity sensors)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'SensorRetrievalAttemptID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'SensorModel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'MissionInProgress';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'SUTAMission';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'WaitingForTempAlarm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'SampleRate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'MissionStartTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'MissionSampleCount';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'RolloverEnabled';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'FirstSampleTimestamp';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'TotalMissionSamples';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'TotalDeviceSamples';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'TemperatureLogging';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'TemperatureHighAlarm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'TemperatureLowAlarm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'DataLogging';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'DataHighAlarm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'DataLowAlarm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether data import was successful', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'IsImportSuccess';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date data were imported into database', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'ImportDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'NULL', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImportHeader', @level2type = N'COLUMN', @level2name = N'username';

