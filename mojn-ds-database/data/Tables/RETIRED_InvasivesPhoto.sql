CREATE TABLE [data].[RETIRED_InvasivesPhoto] (
    [ID]                     INT           IDENTITY (1, 1) NOT NULL,
    [InvasivesObservationID] INT           NOT NULL,
    [PhotoFileNumber]        VARCHAR (30)  NOT NULL,
    [DateCreated]            DATETIME2 (0) CONSTRAINT [DF_InvasivesPhoto_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_InvasivesPhoto] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_InvasivesPhoto_PhotoFileNumber_DisallowZeroLength] CHECK (len([PhotoFileNumber])>(0)),
    CONSTRAINT [FK_InvasivesPhoto_InvasivesObservation] FOREIGN KEY ([InvasivesObservationID]) REFERENCES [data].[InvasivesObservation] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_InvasivesPhoto', @level2type = N'COLUMN', @level2name = N'DateCreated';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The number of the photo as recorded on the camera', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_InvasivesPhoto', @level2type = N'COLUMN', @level2name = N'PhotoFileNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to data.InvasivesObservation (invasive species found at site)', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_InvasivesPhoto', @level2type = N'COLUMN', @level2name = N'InvasivesObservationID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_InvasivesPhoto', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Photos documenting invasive species found at spring', @level0type = N'SCHEMA', @level0name = N'data', @level1type = N'TABLE', @level1name = N'RETIRED_InvasivesPhoto';

