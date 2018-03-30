CREATE TABLE [ref].[Sensor] (
    [ID]            SMALLINT      IDENTITY (1, 1) NOT NULL,
    [SensorModelID] TINYINT       NOT NULL,
    [SerialNumber]  VARCHAR (20)  NOT NULL,
    [Label]         INT           NOT NULL,
    [Summary]       VARCHAR (200) NULL,
    CONSTRAINT [PK_Sensor] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Sensor_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_Sensor_SerialNumber_DisallowZeroLength] CHECK (len([SerialNumber])>(0)),
    CONSTRAINT [CK_Sensor_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [FK_Sensor_SensorModel] FOREIGN KEY ([SensorModelID]) REFERENCES [ref].[SensorModel] ([ID]),
    CONSTRAINT [UN_Sensor_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sensors used to detect presence/absence of water at a spring', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Sensor';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Sensor', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to ref.SensorModel (model of sensor used to detect presence/absence of water)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Sensor', @level2type = N'COLUMN', @level2name = N'SensorModelID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sensor serial number', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Sensor', @level2type = N'COLUMN', @level2name = N'SerialNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Label affixed to sensor that field crew writes on field form', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Sensor', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sensor details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Sensor', @level2type = N'COLUMN', @level2name = N'Summary';

