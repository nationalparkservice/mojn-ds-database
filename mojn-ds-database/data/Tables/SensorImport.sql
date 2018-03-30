CREATE TABLE [data].[SensorImport] (
    [ID]                   INT            IDENTITY (1, 1) NOT NULL,
    [SensorImportHeaderID] INT            NOT NULL,
    [DateTime]             DATETIME2 (0)  NOT NULL,
    [UnitOfMeasure]        TINYINT        NOT NULL,
    [Value]                DECIMAL (5, 2) NOT NULL,
    CONSTRAINT [PK_SensorImport] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_SensorImport_SensorImportHeader] FOREIGN KEY ([SensorImportHeaderID]) REFERENCES [data].[SensorImportHeader] ([ID]) ON DELETE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_SensorImport_SensorImportHeaderID_DateTime]
    ON [data].[SensorImport]([SensorImportHeaderID] ASC, [DateTime] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Imported temperature and humidity data from iButton sensors', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImport', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.SensorImportHeader (metadata associated with temperature and humidity data imported from ibutton sensors)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImport', @level2type = N'COLUMN', @level2name = N'SensorImportHeaderID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date and time of measurement', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImport', @level2type = N'COLUMN', @level2name = N'DateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Unit associated with Value column', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImport', @level2type = N'COLUMN', @level2name = N'UnitOfMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Measured value', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SensorImport', @level2type = N'COLUMN', @level2name = N'Value';

