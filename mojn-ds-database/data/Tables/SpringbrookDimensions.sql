CREATE TABLE [data].[SpringbrookDimensions] (
    [ID]                       INT            IDENTITY (1, 1) NOT NULL,
    [DischargeActivityID]      INT            NOT NULL,
    [SpringbrookLength_m] DECIMAL (5, 2) NULL,
    [SpringbrookWidth_m]       DECIMAL (5, 2) NULL,
    [SpringbrookLengthFlagID]  TINYINT        NULL,
    [Notes]                    VARCHAR (500)  NULL,
    [DateCreated]              DATETIME2 (0)  CONSTRAINT [DF_SpringbrookDimensions_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_SpringbrookDimensions] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_SpringbrookDimensions_Notes_DisallowZeroLength] CHECK (len([Notes])>(0)),
    CONSTRAINT [CK_SpringbrookDimensions_SpringbrookLength_m] CHECK ([SpringbrookLength_m]>=(0) AND [SpringbrookLength_m]<=(1000)),
    CONSTRAINT [CK_SpringbrookDimensions_SpringbrookWidth_m] CHECK ([SpringbrookWidth_m]>=(0) AND [SpringbrookWidth_m]<=(100)),
    CONSTRAINT [FK_SpringbrookDimensions_DischargeActivity] FOREIGN KEY ([DischargeActivityID]) REFERENCES [data].[DischargeActivity] ([ID]),
    CONSTRAINT [FK_SpringbrookDimensions_SpringbrookLengthFlag] FOREIGN KEY ([SpringbrookLengthFlagID]) REFERENCES [lookup].[SpringbrookLengthFlag] ([ID])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Dimensions and description of springbrook', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.DischargeEvent (general discharge information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions', @level2type = N'COLUMN', @level2name = N'DischargeActivityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Length of springbrook in meters', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions', @level2type = N'COLUMN', @level2name = 'SpringbrookLength_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Width of springbrook in meters', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions', @level2type = N'COLUMN', @level2name = N'SpringbrookWidth_m';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.SpringbrookLengthFlag (indicates whether springbrook length is greater than reported length)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions', @level2type = N'COLUMN', @level2name = N'SpringbrookLengthFlagID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Notes on springbrook', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions', @level2type = N'COLUMN', @level2name = N'Notes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'SpringbrookDimensions', @level2type = N'COLUMN', @level2name = N'DateCreated';

