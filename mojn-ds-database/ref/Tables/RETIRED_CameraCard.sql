CREATE TABLE [ref].[RETIRED_CameraCard] (
    [ID]             SMALLINT     IDENTITY (1, 1) NOT NULL,
    [Label]          VARCHAR (50) NOT NULL,
    [Manufacturer]   VARCHAR (50) NULL,
    [CardType]       VARCHAR (50) NULL,
    [CardCapacityGB] SMALLINT     NULL,
    CONSTRAINT [PK_CameraCard] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_CameraCard_CardType_DisallowZeroLength] CHECK (len([CardType])>(0)),
    CONSTRAINT [CK_CameraCard_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_CameraCard_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [UN_CameraCard_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Capacity of camera memory card', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_CameraCard', @level2type = N'COLUMN', @level2name = N'CardCapacityGB';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of camera memory card (e.g. xD, sD, etc)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_CameraCard', @level2type = N'COLUMN', @level2name = N'CardType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Camera card manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_CameraCard', @level2type = N'COLUMN', @level2name = N'Manufacturer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Numeric label on camera card that field crew writes on field form', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_CameraCard', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_CameraCard', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Camera memory cards, each with a unique identifier', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_CameraCard';

