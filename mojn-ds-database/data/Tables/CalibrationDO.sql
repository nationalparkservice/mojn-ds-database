CREATE TABLE [data].[CalibrationDO] (
    [ID]                             INT            IDENTITY (1, 1) NOT NULL,
    [CalibrationTime]                DATETIME2 (0)  NULL,
    [CalibrationDate]                DATETIME2 (0)  NOT NULL,
    [PreCalibrationReading_percent]  DECIMAL (5, 2) NOT NULL,
    [PreCalibrationTemperature_C]    DECIMAL (5, 2) NOT NULL,
    [PostCalibrationReading_percent] DECIMAL (5, 2) NOT NULL,
    [PostCalibrationTemperature_C]   DECIMAL (5, 2) NOT NULL,
    [BarometricPressure_mmHg]        DECIMAL (5, 2) NULL,
    [DOInstrumentID]                 TINYINT        NOT NULL,
    [Notes]                          VARCHAR (1000) NULL,
    [DateCreated]                    DATETIME2 (0)  CONSTRAINT [DF_CalibrationDO_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CalibrationDO] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_CalibrationDO_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_CalibrationDO_PostCalibrationReading_percent] CHECK ([PostCalibrationReading_percent]>=(0) AND [PostCalibrationReading_percent]<=(300) OR [PostCalibrationReading_percent]=(-999)),
    CONSTRAINT [FK_CalibrationDO_DOInstrument] FOREIGN KEY ([DOInstrumentID]) REFERENCES [ref].[WaterQualityInstrument] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_CalibrationDO_CalibrationDate_CalibrationTime]
    ON [data].[CalibrationDO]([CalibrationDate] ASC, [CalibrationTime] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dissolved oxygen instrument calibration results', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time of calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'CalibrationTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'CalibrationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre-calibration dissolved oxygen reading in percent', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'PreCalibrationReading_percent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre-calibration temperature in C', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'PreCalibrationTemperature_C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Post-calibration dissolved oxygen reading in percent', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'PostCalibrationReading_percent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Post-calibration temperature in C', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'PostCalibrationTemperature_C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Barometric Pressure in mmHg', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'BarometricPressure_mmHg';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WaterQualityInstrument (instrument being calibrated)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'DOInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about this calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationDO', @level2type = N'COLUMN', @level2name = N'DateCreated';

