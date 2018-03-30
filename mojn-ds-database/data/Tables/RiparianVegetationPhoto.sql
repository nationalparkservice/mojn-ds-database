CREATE TABLE [data].[RiparianVegetationPhoto] (
    [ID]                              INT           IDENTITY (1, 1) NOT NULL,
    [RiparianVegetationObservationID] INT           NOT NULL,
    [PhotoFileNumber]                 VARCHAR (30)  NOT NULL,
    [DateCreated]                     DATETIME2 (0) CONSTRAINT [DF_RiparianVegetationPhoto_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RiparianVegetationPhoto] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_RiparianVegetationPhoto_PhotoFileNumber_DisallowZeroLength] CHECK (len([PhotoFileNumber])>(0)),
    CONSTRAINT [FK_RiparianVegetationPhoto_RiparianVegetationObservation] FOREIGN KEY ([RiparianVegetationObservationID]) REFERENCES [data].[RiparianVegetationObservation] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_RiparianVegetationObservationID_PhotoFileNumber]
    ON [data].[RiparianVegetationPhoto]([RiparianVegetationObservationID] ASC, [PhotoFileNumber] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Photos associated with riparian vegetation observations', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationPhoto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationPhoto', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.RiparianVegetationObservation (observations of riparian vegetation, classified by lifeform and relative abundance)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationPhoto', @level2type = N'COLUMN', @level2name = N'RiparianVegetationObservationID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of the photo as recorded on the camera', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationPhoto', @level2type = N'COLUMN', @level2name = N'PhotoFileNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RiparianVegetationPhoto', @level2type = N'COLUMN', @level2name = N'DateCreated';

