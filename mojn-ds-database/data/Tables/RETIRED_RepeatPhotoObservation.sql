CREATE TABLE [data].[RepeatPhotoObservation] (
    [ID]                    INT             IDENTITY (1, 1) NOT NULL,
    [RepeatPhotoActivityID] INT             NOT NULL,
    [RepeatPhotoTypeID]     TINYINT         NOT NULL,
    [UtmX_m]                DECIMAL (8, 2)  NULL,
    [UtmY_m]                DECIMAL (9, 2)  NULL,
    [HorizontalDatumID]     TINYINT         NULL,
    [UTMZone]               TINYINT         NULL,
    [GPSUnitID]             TINYINT         NULL,
    [Notes]                 VARCHAR (500)   NULL,
    [DateCreated]           DATETIME2 (0)   CONSTRAINT [DF_RepeatPhotoObservation_DateCreated] DEFAULT (getdate()) NOT NULL,
    [GpsX]                  DECIMAL (13, 8) NULL,
    [GpsY]                  DECIMAL (13, 8) NULL,
    CONSTRAINT [PK_RepeatPhotoObservation] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_RepeatPhotoObservation_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_RepeatPhotoObservation_UtmX_m] CHECK ([UtmX_m]>=(200000) AND [UtmX_m]<=(900000)),
    CONSTRAINT [CK_RepeatPhotoObservation_UtmY_m] CHECK ([UtmY_m]>=(3500000) AND [UtmY_m]<=(4350000)),
    CONSTRAINT [FK_RepeatPhotoObservation_HorizontalDatum] FOREIGN KEY ([HorizontalDatumID]) REFERENCES [lookup].[HorizontalDatum] ([ID]),
    CONSTRAINT [FK_RepeatPhotoObservation_RepeatPhotoActivity] FOREIGN KEY ([RepeatPhotoActivityID]) REFERENCES [data].[RepeatPhotoActivity] ([ID]),
    CONSTRAINT [FK_RepeatPhotoObservation_RepeatPhotoType] FOREIGN KEY ([RepeatPhotoTypeID]) REFERENCES [lookup].[RepeatPhotoType] ([ID]),
    CONSTRAINT [FK_RepeatPhotoObservation_UTMZone] FOREIGN KEY ([UTMZone]) REFERENCES [lookup].[UTMZone] ([ID])
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Repeat photopoint information', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.RepeatPhotoEvent (general information about repeat photos)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'RepeatPhotoActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.RepeatPhotoType (type of repeat photo)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'RepeatPhotoTypeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM X coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'UtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Y coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'UtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.HorizontalDatum (horizontal datum of utm coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'HorizontalDatumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to UTM Zone lookup table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'UTMZone';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about this photo observation', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhotoObservation', @level2type = N'COLUMN', @level2name = N'DateCreated';

