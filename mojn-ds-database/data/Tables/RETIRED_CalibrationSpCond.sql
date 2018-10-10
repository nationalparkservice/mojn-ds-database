CREATE TABLE [data].[RETIRED_CalibrationSpCond] (
    [ID]                                   INT            IDENTITY (1, 1) NOT NULL,
    [CalibrationDate]                      DATETIME2 (0)  NOT NULL,
    [CalibrationTime]                      DATETIME2 (0)  NULL,
    [StandardValue_microS_per_cm]          DECIMAL (7, 1) NOT NULL,
    [PreCalibrationReading_microS_per_cm]  DECIMAL (7, 1) NOT NULL,
    [PostCalibrationReading_microS_per_cm] DECIMAL (7, 1) NOT NULL,
    [SpCondInstrumentID]                   TINYINT        NOT NULL,
    [Notes]                                VARCHAR (1000) NULL,
    [DateCreated]                          DATETIME2 (0)  CONSTRAINT [DF_CalibrationSpCond_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CalibrationSpCond] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_CalibrationSpCond_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_CalibrationSpCond_PostCalibrationReading_microS_per_cm] CHECK ([PostCalibrationReading_microS_per_cm]>=(0) AND [PostCalibrationReading_microS_per_cm]<=(200000) OR [PostCalibrationReading_microS_per_cm]=(-999)),
    CONSTRAINT [FK_CalibrationSpCond_SpCondInstrument] FOREIGN KEY ([SpCondInstrumentID]) REFERENCES [ref].[RETIRED_WaterQualityInstrument] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_CalibrationSpCond_CalibrationDate_CalibrationTime]
    ON [data].[RETIRED_CalibrationSpCond]([CalibrationDate] ASC, [CalibrationTime] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'DateCreated';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about this calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.WaterQualityInstrument (instrument being calibrated)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'SpCondInstrumentID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Post-calibration Specific Conductivity reading in microsiemens per cm', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'PostCalibrationReading_microS_per_cm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Pre-calibration Specific Conductivity reading in microsiemens per cm', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'PreCalibrationReading_microS_per_cm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Standard value of Specific Conductivity solution in microsiemens per cm', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'StandardValue_microS_per_cm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Time of calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'CalibrationTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date of calibration', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'CalibrationDate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Specific conductance instrument calibration results', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_CalibrationSpCond';

