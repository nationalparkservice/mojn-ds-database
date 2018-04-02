CREATE TABLE [lookup].[RepeatPhotoType] (
    [ID]       TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]     VARCHAR (10) NOT NULL,
    [Label]    VARCHAR (50) NOT NULL,
    [IsActive] BIT          CONSTRAINT [DF_RepeatPhotoType_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_RepeatPhotoType] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_RepeatPhotoType_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_RepeatPhotoType_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of repeat photo', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'RepeatPhotoType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'RepeatPhotoType', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'RepeatPhotoType', @level2type = N'COLUMN', @level2name = N'Label';

