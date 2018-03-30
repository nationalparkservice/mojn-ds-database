CREATE TABLE [ref].[GPSUnit] (
    [ID]           TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]        VARCHAR (50)  NOT NULL,
    [Summary]      VARCHAR (200) NULL,
    [IsActive]     BIT           NOT NULL,
    [Model]        VARCHAR (40)  NOT NULL,
    [Manufacturer] VARCHAR (20)  NOT NULL,
    CONSTRAINT [PK_GPSUnit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_GPSUnit_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_GPSUnit_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [CK_GPSUnit_Model_DisallowZeroLength] CHECK (len([Model])>(0)),
    CONSTRAINT [CK_GPSUnit_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_GPSUnit_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'GPS units, each with a unique identifier', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label on GPS unit that field crew writes on the field form', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this instrument is currently used to collect data', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'GPS unit model', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit', @level2type = N'COLUMN', @level2name = N'Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'GPS unit manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'GPSUnit', @level2type = N'COLUMN', @level2name = N'Manufacturer';

