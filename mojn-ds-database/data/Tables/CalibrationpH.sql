CREATE TABLE [data].[CalibrationpH] (
    [ID]                           INT            IDENTITY (1, 1) NOT NULL,
    [CalibrationTime]              DATETIME2 (0)  NULL,
    [CalibrationDate]              DATETIME2 (0)  NOT NULL,
    [StandardValue_pH]             DECIMAL (5, 2) NOT NULL,
	[TemperatureCorrectedStd_pH]   DECIMAL (5,2)  NULL,
    [PreCalibrationReading_pH]     DECIMAL (5, 2) NULL,
    [PreCalibrationTemperature_C]  DECIMAL (5, 2) NULL,
    [PostCalibrationReading_pH]    DECIMAL (5, 2) NULL,
    [PostCalibrationTemperature_C] DECIMAL (5, 2) NULL,
    [pHInstrumentID]               TINYINT        NOT NULL,
    [Notes]                        VARCHAR (1000) NULL,
    [DateCreated]                  DATETIME2 (0)  CONSTRAINT [DF_CalibrationpH_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CalibrationpH] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_CalibrationpH_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_CalibrationpH_PostCalibrationReading_pH] CHECK ([PostCalibrationReading_pH]>=(0) AND [PostCalibrationReading_pH]<=(14) OR [PostCalibrationReading_pH]=(-999)),
    CONSTRAINT [CK_CalibrationpH_StandardValue_pH] CHECK ([StandardValue_pH]>=(3) AND [StandardValue_pH]<=(11) OR [StandardValue_pH]=(-999)),
    CONSTRAINT [FK_CalibrationpH_pHInstrument] FOREIGN KEY ([pHInstrumentID]) REFERENCES [ref].[WaterQualityInstrument] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_CalibrationpH_CalibrationDate_CalibrationTime_StandardValue_pH]
    ON [data].[CalibrationpH]([CalibrationDate] ASC, [CalibrationTime] ASC, [StandardValue_pH] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'pH instrument calibration results', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time of calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'CalibrationTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'CalibrationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Standard value of pH solution', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'StandardValue_pH';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Temperature-corrected standard value of pH solution (only applies to some instruments)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'TemperatureCorrectedStd_pH';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre-calibration pH value', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'PreCalibrationReading_pH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre-calibration temperature in C', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'PreCalibrationTemperature_C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Post-calibration pH value', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'PostCalibrationReading_pH';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Post-calibration temperature in C', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'PostCalibrationTemperature_C';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WaterQualityInstrument (instrument being calibrated)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'pHInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about this calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'CalibrationpH', @level2type = N'COLUMN', @level2name = N'DateCreated';

