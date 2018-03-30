CREATE TABLE [ref].[PhotoDescriptionCode] (
    [ID]                SMALLINT     IDENTITY (1, 1) NOT NULL,
    [Code]              VARCHAR (10) NOT NULL,
    [Label]             VARCHAR (50) NOT NULL,
    [IsMonitoringPhoto] BIT          NOT NULL,
    [PhotoSOPID]        TINYINT      NOT NULL,
    [IsActive]          BIT          NOT NULL,
    CONSTRAINT [PK_PhotoDescriptionCode] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_PhotoDescriptionCode_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_PhotoDescriptionCode_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [FK_PhotoDescriptionCode_PhotoSOP] FOREIGN KEY ([PhotoSOPID]) REFERENCES [lookup].[PhotoSOP] ([ID]),
    CONSTRAINT [UN_PhotoDescriptionCode_PhotoSOPID_Code] UNIQUE NONCLUSTERED ([PhotoSOPID] ASC, [Code] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short descriptions of photos (used in photo file naming)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether this photo is of potential scientific value, however anecdotal', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'IsMonitoringPhoto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.PhotoSOP (the SOP that the photo is associated with)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'PhotoDescriptionCode', @level2type = N'COLUMN', @level2name = N'PhotoSOPID';

