CREATE TABLE [temp].[LoadPhotoData]
(
	[VisitID] INT NOT NULL , 
    [DateTaken] DATETIME2(0) NOT NULL, 
    [PhotoDescription] VARCHAR(20) NOT NULL, 
    [SOPID] TINYINT NOT NULL, 
    [IsLibraryPhotoID] TINYINT NOT NULL, 
    [OriginalFilePath] VARCHAR(300) NOT NULL, 
    [RenamedFilePath] VARCHAR(300) NOT NULL, 
    [Notes] VARCHAR(500) NULL, 
    [GPSUnitID] TINYINT NULL, 
    [HorizontalDatumID] TINYINT NULL, 
    [UTMZoneID] TINYINT NULL, 
    [UtmX_m] DECIMAL(8, 2) NULL, 
    [UtmY_m] DECIMAL(9, 2) NULL
)
