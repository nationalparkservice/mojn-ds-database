CREATE TABLE [data].[Photo] (
    [ID]                     INT           IDENTITY (1, 1) NOT NULL,
    [PhotoActivityID]        INT           NOT NULL,
	[DateTaken]				 DATETIME2 (0) NOT NULL,
    [PhotoDescriptionCodeID] SMALLINT      NOT NULL,
    [IsLibraryPhotoID]       TINYINT       NOT NULL,
    [OriginalFilePath]       VARCHAR (300) NOT NULL,
    [RenamedFilePath]        VARCHAR (300) NULL,
	[GPSUnitID]				TINYINT        NULL,
    [HorizontalDatumID]		TINYINT        NULL,
    [UTMZoneID]				TINYINT        NULL,
    [UtmX_m]				DECIMAL (8, 2) NULL,
    [UtmY_m]				DECIMAL (9, 2) NULL,
    [Notes]                  VARCHAR (500) NULL,
    [DateCreated]            DATETIME2 (0) CONSTRAINT [DF_Photo_DateCreated] DEFAULT (getdate()) NOT NULL,

    CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Photo_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_Photo_OriginalFilePath_DisallowZeroLength] CHECK (len([OriginalFilePath])>(0)),
    CONSTRAINT [CK_Photo_RenamedFilePath_DisallowZeroLength] CHECK (len([RenamedFilePath])>(0)),
    CONSTRAINT [FK_Photo_IsLibraryPhoto] FOREIGN KEY ([IsLibraryPhotoID]) REFERENCES [lookup].[IsLibraryPhoto] ([ID]),
    CONSTRAINT [FK_Photo_PhotoActivity] FOREIGN KEY ([PhotoActivityID]) REFERENCES [data].[PhotoActivity] ([ID]),
    CONSTRAINT [FK_Photo_PhotoDescriptionCode] FOREIGN KEY ([PhotoDescriptionCodeID]) REFERENCES [ref].[PhotoDescriptionCode] ([ID]),
	CONSTRAINT [CK_Photo_UtmX_m] CHECK (UtmX_m IS NULL OR ([UtmX_m]>=(200000) AND [UtmX_m]<=(900000))),
    CONSTRAINT [CK_Photo_UtmY_m] CHECK (UtmX_m IS NULL OR ([UtmY_m]>=(3500000) AND [UtmY_m]<=(4350000))),
    CONSTRAINT [FK_Photo_HorizontalDatum] FOREIGN KEY ([HorizontalDatumID]) REFERENCES [lookup].[HorizontalDatum] ([ID]),
    CONSTRAINT [FK_Photo_UTMZone] FOREIGN KEY ([UTMZoneID]) REFERENCES [lookup].[UTMZone] ([ID])
);


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Photos taken at the spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.PhotoEvent (general photo information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'PhotoActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.PhotoShortDescription (short descriptions of photos (used in photo file naming))', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'PhotoDescriptionCodeID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.IsLibraryPhoto (indicates whether photo may be a good candiate for inclusion in newsletters or other communication products)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'IsLibraryPhotoID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'File path to the original photo on the shared drive', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'OriginalFilePath';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'File path to the photo once it has been copied to the appropriate monitoring folder and renamed', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'RenamedFilePath';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.GPSUnit (gps units, each with a unique identifier)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'GPSUnitID';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.HorizontalDatum (horizontal datum of UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'HorizontalDatumID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.UTMZone (zone associated with UTM coordinates)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'UTMZoneID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM X coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'UtmX_m';


GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Y coordinate', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'UtmY_m';

GO

EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes about the photo', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Photo', @level2type = N'COLUMN', @level2name = N'DateCreated';


GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_Photo_PhotoActivityID_PhotoDescriptionCodeID_OriginalFilePath] ON [data].[Photo] (PhotoActivityID ASC, PhotoDescriptionCodeID ASC, OriginalFilePath ASC)

GO

CREATE UNIQUE NONCLUSTERED INDEX [UX_RenamedFilePath] ON [data].[Photo] (RenamedFilePath ASC)
