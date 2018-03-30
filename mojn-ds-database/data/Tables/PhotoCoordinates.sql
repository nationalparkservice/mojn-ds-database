CREATE TABLE [data].[PhotoCoordinates] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [GPSUnitID]         TINYINT        NOT NULL,
    [PhotoID]           INT            NOT NULL,
    [HorizontalDatumID] TINYINT        NOT NULL,
    [UTMZoneID]         TINYINT        NOT NULL,
    [UtmX_m]            DECIMAL (8, 2) NOT NULL,
    [UtmY_m]            DECIMAL (9, 2) NOT NULL,
    [DateCreated]       DATETIME2 (0)  CONSTRAINT [DF_PhotoCoordinates_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_PhotoCoordinates] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PhotoCoordinates_UtmX_m] CHECK ([UtmX_m]>=(200000) AND [UtmX_m]<=(900000)),
    CONSTRAINT [CK_PhotoCoordinates_UtmY_m] CHECK ([UtmY_m]>=(3500000) AND [UtmY_m]<=(4350000)),
    CONSTRAINT [FK_PhotoCoordinates_GPSUnit] FOREIGN KEY ([GPSUnitID]) REFERENCES [ref].[GPSUnit] ([ID]),
    CONSTRAINT [FK_PhotoCoordinates_HorizontalDatum] FOREIGN KEY ([HorizontalDatumID]) REFERENCES [lookup].[HorizontalDatum] ([ID]),
    CONSTRAINT [FK_PhotoCoordinates_Photo] FOREIGN KEY ([PhotoID]) REFERENCES [data].[Photo] ([ID]),
    CONSTRAINT [FK_PhotoCoordinates_UTMZone] FOREIGN KEY ([UTMZoneID]) REFERENCES [lookup].[UTMZone] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_PhotoCoordinates_PhotoID]
    ON [data].[PhotoCoordinates]([PhotoID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Coordinates associated with photos', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.GPSUnit (gps units, each with a unique identifier)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'GPSUnitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.Photo (photos taken at the spring)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'PhotoID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.HorizontalDatum (horizontal datum of UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'HorizontalDatumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.UTMZone (zone associated with UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'UTMZoneID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM X coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'UtmX_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Y coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'UtmY_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'PhotoCoordinates', @level2type = N'COLUMN', @level2name = N'DateCreated';

