CREATE TABLE [ref].[SensorModel] (
    [ID]           TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]        VARCHAR (100) NOT NULL,
    [Manufacturer] VARCHAR (50)  NOT NULL,
    [Model]        VARCHAR (25)  NOT NULL,
    [Summary]      VARCHAR (200) NULL,
    CONSTRAINT [PK_SensorModel] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SensorModel_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_SensorModel_Manufacturer_DisallowZeroLength] CHECK (len([Manufacturer])>(0)),
    CONSTRAINT [CK_SensorModel_Model_DisallowZeroLength] CHECK (len([Model])>(0)),
    CONSTRAINT [CK_SensorModel_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_SensorModel_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Model of sensor used to detect presence/absence of water', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'SensorModel';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'SensorModel', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'SensorModel', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sensor manufacturer', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'SensorModel', @level2type = N'COLUMN', @level2name = N'Manufacturer';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Official model name or number', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'SensorModel', @level2type = N'COLUMN', @level2name = N'Model';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'SensorModel', @level2type = N'COLUMN', @level2name = N'Summary';

