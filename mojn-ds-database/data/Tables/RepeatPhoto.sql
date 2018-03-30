CREATE TABLE [data].[RepeatPhoto] (
    [ID]                       INT           IDENTITY (1, 1) NOT NULL,
    [RepeatPhotoObservationID] INT           NOT NULL,
    [PhotoFileNumber]          VARCHAR (30)  NOT NULL,
    [DateCreated]              DATETIME2 (0) CONSTRAINT [DF_RepeatPhoto_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_RepeatPhoto] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_RepeatPhoto_PhotoFileNumber_DisallowZeroLength] CHECK (len([PhotoFileNumber])>(0)),
    CONSTRAINT [FK_RepeatPhoto_RepeatPhotoObservation] FOREIGN KEY ([RepeatPhotoObservationID]) REFERENCES [data].[RepeatPhotoObservation] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UN_RepeatPhoto_RepeatPhotoObservationID_PhotoFileNumber] UNIQUE NONCLUSTERED ([RepeatPhotoObservationID] ASC, [PhotoFileNumber] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Photographs taken at a repeat photopoint', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhoto';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhoto', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.RepeatPhotoObservation (repeat photopoint information)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhoto', @level2type = N'COLUMN', @level2name = N'RepeatPhotoObservationID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of the photo as displayed by the camera and recorded on the field form.', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhoto', @level2type = N'COLUMN', @level2name = N'PhotoFileNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RepeatPhoto', @level2type = N'COLUMN', @level2name = N'DateCreated';

