CREATE TABLE [lookup].[WildlifeType] (
    [ID]       TINYINT      IDENTITY (1, 1) NOT NULL,
    [Code]     VARCHAR (6)  NOT NULL,
    [Label]    VARCHAR (25) NOT NULL,
    [IsActive] BIT          CONSTRAINT [DF_WildlifeType_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_WildlifeTypes] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_WildlifeType_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_WildlifeType_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [UN_WildlifeType_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_WildlifeType_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_WildlifeTypes_Code]
    ON [lookup].[WildlifeType]([Code] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_WildlifeTypes_Label]
    ON [lookup].[WildlifeType]([Label] ASC);


GO

CREATE TRIGGER [lookup].[WildlifeTypeInsert]
ON [lookup].[WildlifeType]
AFTER INSERT
AS 
-- Insert new row(s) into ref.PhotoDescriptionCode
INSERT INTO ref.PhotoDescriptionCode (
	Code,
	Label,
	IsMonitoringPhoto,
	PhotoSOPID,
	IsActive)
SELECT
	i.Code,
	i.Label,
	1 AS IsMonitoringPhoto,
	4 AS PhotoSOPID,
	i.IsActive
FROM inserted i
LEFT JOIN ref.PhotoDescriptionCode p ON i.Code = p.Code AND p.PhotoSOPID = 4
WHERE p.Code IS NULL


GO




CREATE TRIGGER [lookup].[WildlifeTypeDelete]
ON [lookup].[WildlifeType]
AFTER DELETE
AS 
-- Check if deleted code is being used as a photo description. If it is, don't delete the code from the lookup.
-- Otherwise, delete the code from the lookup and from ref.PhotoDescriptionCode.
IF EXISTS (
	SELECT *
	FROM deleted d
	INNER JOIN ref.PhotoDescriptionCode p ON d.Code = p.Code 
	INNER JOIN data.Photo ph ON ph.PhotoDescriptionCodeID = p.ID
	WHERE p.PhotoSOPID = 4
	)
	BEGIN
		RAISERROR ('Cannot delete wildlife type code(s). One or more of these codes is also being used as a photo description code.', 10, 1);
		ROLLBACK TRANSACTION;
	END
ELSE
	BEGIN
		DELETE FROM ref.PhotoDescriptionCode
		WHERE EXISTS
			(SELECT *
			 FROM deleted
			 WHERE deleted.Code = PhotoDescriptionCode.Code AND PhotoDescriptionCode.PhotoSOPID = 4);
	END




GO




CREATE TRIGGER [lookup].[WildlifeTypeUpdate]
ON [lookup].[WildlifeType]
AFTER UPDATE
AS 
-- Check if a) the code is being changed and b) the code is being used in a photo record. If this is the case, prevent the update.
IF EXISTS (
	SELECT *
	FROM deleted d
	INNER JOIN inserted i ON d.ID = i.ID
	INNER JOIN ref.PhotoDescriptionCode p ON d.Code = p.Code AND p.PhotoSOPID = 4
	INNER JOIN data.Photo ph ON ph.PhotoDescriptionCodeID = p.ID
	WHERE d.Code != i.Code
	)
	BEGIN
		RAISERROR ('Cannot change wildlife type code(s). One or more of these codes is also being used as a photo description code.', 10, 1);
		ROLLBACK TRANSACTION;
	END
-- If the code isn't being changed or isn't being used in a photo record, update the corresponding row(s) in ref.PhotoDescriptionCode 
ELSE
	BEGIN
		UPDATE ref.PhotoDescriptionCode
		SET Label = (SELECT i.Label 
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 4),
			IsActive = (SELECT i.IsActive
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 4),
			Code = (SELECT i.Code 
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 4)
		WHERE EXISTS
			(SELECT * 
			FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
			WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 4);
	END




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Broad wildlife categories of interest', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType', @level2type = N'COLUMN', @level2name = N'Code';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'WildlifeType', @level2type = N'COLUMN', @level2name = N'Label';

