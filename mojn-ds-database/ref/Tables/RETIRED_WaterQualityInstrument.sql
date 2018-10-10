CREATE TABLE [ref].[RETIRED_WaterQualityInstrument] (
    [ID]             TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]          VARCHAR (50)  NOT NULL,
    [Summary]        VARCHAR (200) NULL,
    [Model]          VARCHAR (40)  NOT NULL,
    [Manufacturer]   VARCHAR (20)  NULL,
    [NPSPropertyTag] VARCHAR (25)  NULL,
    [IsActive]       BIT           NOT NULL,
    CONSTRAINT [PK_WaterQualityInstrument] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WaterQualityInstrument_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_Model_DisallowZeroLength] CHECK (len([Model])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_NPSPropertyTag_DisallowZeroLength] CHECK (len([NPSPropertyTag])>(0)),
    CONSTRAINT [CK_WaterQualityInstrument_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_WaterQualityInstrument_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this instrument is currently used to collect data', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'National Park Service property tag number', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'NPSPropertyTag';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'WQ instrument manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Manufacturer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'WQ instrument model', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label on water quality instrument that field crew writes on field form', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Instruments used for discrete water quality measurements', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'RETIRED_WaterQualityInstrument';

