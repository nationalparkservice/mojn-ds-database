CREATE TABLE [data].[Site] (
    [ID]                INT            IDENTITY (1, 1) NOT NULL,
    [ParkID]            TINYINT        NOT NULL,
    [Name]              VARCHAR (50)   NOT NULL,
    [Code]              VARCHAR (20)   NOT NULL,
    [SubunitID]         SMALLINT       NULL,
    [AccessDirections]  VARCHAR (MAX)  NULL,
    [LEGACY_GRTSNumber]        INT            NULL,
    [Lat_WGS84]         DECIMAL (8, 6) NULL,
    [Lon_WGS84]         DECIMAL (9, 6) NULL,
    [X_UTM_NAD83_11N]   DECIMAL (8, 2) NULL,
    [Y_UTM_NAD83_11N]   DECIMAL (9, 2) NULL,
    [X_UTM_NAD83_12N]   DECIMAL (8, 2) NULL,
    [Y_UTM_NAD83_12N]   DECIMAL (9, 2) NULL,
    [ProtectedStatusID] TINYINT        NULL,
    [GRTSDrawID]        TINYINT        NULL,
    [GRTSOrder]         INT            NULL,
    [GRTSStatusID]      TINYINT        NULL,
    [GRTSPanelID]       TINYINT        NULL,
    [DateCreated]       DATETIME2 (0)  CONSTRAINT [DF_Site_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Site] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Site_AccessDirections_DisallowZeroLength] CHECK (len([AccessDirections])>(0)),
    CONSTRAINT [CK_Site_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_Site_Lat_WGS84_Range] CHECK ([Lat_WGS84]>=(33.5) AND [Lat_WGS84]<=(39.2) OR [Lat_WGS84]=(0)),
    CONSTRAINT [CK_Site_Lon_WGS84_Range] CHECK ([Lon_WGS84]>=(-119) AND [Lon_WGS84]<=(-112.5) OR [Lon_WGS84]=(0)),
    CONSTRAINT [CK_Site_Name_DisallowZeroLength] CHECK (len([Name])>(0)),
    CONSTRAINT [CK_Site_X_UTM_NAD83_11N_Range] CHECK ([X_UTM_NAD83_11N]>=(350000) AND [X_UTM_NAD83_11N]<=(900000) OR [X_UTM_NAD83_11N]=(0)),
    CONSTRAINT [CK_Site_X_UTM_NAD83_12N_Range] CHECK ([X_UTM_NAD83_12N]>=(200000) AND [X_UTM_NAD83_12N]<=(450000) OR [X_UTM_NAD83_12N]=(0)),
    CONSTRAINT [CK_Site_Y_UTM_NAD83_11N_Range] CHECK ([Y_UTM_NAD83_11N]>=(3500000) AND [Y_UTM_NAD83_11N]<=(4350000) OR [Y_UTM_NAD83_11N]=(0)),
    CONSTRAINT [CK_Site_Y_UTM_NAD83_12N_Range] CHECK ([Y_UTM_NAD83_12N]>=(3500000) AND [Y_UTM_NAD83_12N]<=(4350000) OR [Y_UTM_NAD83_12N]=(0)),
    CONSTRAINT [FK_Site_GRTSDraw] FOREIGN KEY ([GRTSDrawID]) REFERENCES [lookup].[GRTSDraw] ([ID]),
    CONSTRAINT [FK_Site_GRTSPanel] FOREIGN KEY ([GRTSPanelID]) REFERENCES [lookup].[GRTSPanel] ([ID]),
    CONSTRAINT [FK_Site_GRTSStatus] FOREIGN KEY ([GRTSStatusID]) REFERENCES [lookup].[GRTSStatus] ([ID]),
    CONSTRAINT [FK_Site_Park] FOREIGN KEY ([ParkID]) REFERENCES [lookup].[Park] ([ID]),
    CONSTRAINT [FK_Site_ProtectedStatus] FOREIGN KEY ([ProtectedStatusID]) REFERENCES [lookup].[ProtectedStatus] ([ID]),
    CONSTRAINT [FK_Site_Subunit] FOREIGN KEY ([SubunitID]) REFERENCES [lookup].[Subunit] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Site_Code]
    ON [data].[Site]([Code] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[SpringLocation].[PrimaryKey]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'CONSTRAINT', @level2name = N'PK_Site';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The springs contained in the sampling frame', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[SpringLocation].[ID]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.Park (the park in which the spring is located)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ParkID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[SpringLocation].[LandManagementUnitID]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'ParkID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[SpringLocation].[SpringName]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unique spring code, formatted [4-letter park code]_P_[1st 3 letters of spring name][4 digit number, unique within park]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[SpringLocation].[Code]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.Subunit (management units into which parks are subdivided)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'SubunitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[SpringLocation].[SubunitID]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'SubunitID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Directions to spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'AccessDirections';


GO
EXECUTE sp_addextendedproperty @name = N'MS_SSMA_SOURCE', @value = N'MultiNetworkSprings - Copy.[SpringLocation].[AccessDirections]', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'AccessDirections';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Legacy GRTS number; now replaced by GRTSOrder', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = 'LEGACY_GRTSNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Latitude of spring location. Typically comes from springs inventory.', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Lat_WGS84';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Longitude of spring location. Typically comes from springs inventory.', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Lon_WGS84';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Zone 11N X coordinate of spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'X_UTM_NAD83_11N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Zone 11N Y coordinate of spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Y_UTM_NAD83_11N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Zone 12N X coordinate of spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'X_UTM_NAD83_12N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'UTM Zone 12N Y coordinate of spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'Y_UTM_NAD83_12N';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.GRTSDraw (documents the grts draw that applies to these locations.)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'GRTSDrawID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Order that spring appears in the GRTS draw. Unique for a GRTS frame', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'GRTSOrder';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.GRTSStatus (documents the grts status of this plot)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'GRTSStatusID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.GRTSPanel (documents the grts sampling panel applied to this location.)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'GRTSPanelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'Site', @level2type = N'COLUMN', @level2name = N'DateCreated';

