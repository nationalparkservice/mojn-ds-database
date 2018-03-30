CREATE TABLE [lookup].[LifeForm] (
    [ID]       TINYINT       IDENTITY (1, 1) NOT NULL,
    [Label]    VARCHAR (15)  NOT NULL,
    [Summary]  VARCHAR (500) NULL,
    [Code]     VARCHAR (15)  NOT NULL,
    [IsActive] BIT           CONSTRAINT [DF_LifeForm_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_LifeForm] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_LifeForm_Code_DisallowZeroLength] CHECK (len([Code])>(0)),
    CONSTRAINT [CK_LifeForm_Label_DisallowZeroLength] CHECK (len([Label])>(0)),
    CONSTRAINT [CK_LifeForm_Summary_DisallowZeroLength] CHECK (len([Summary])>(0)),
    CONSTRAINT [UN_LifeForm_Code] UNIQUE NONCLUSTERED ([Code] ASC),
    CONSTRAINT [UN_LifeForm_Label] UNIQUE NONCLUSTERED ([Label] ASC)
);


GO


CREATE TRIGGER [lookup].[LifeFormInsert]
ON [lookup].[LifeForm]
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
	2 AS PhotoSOPID,
	i.IsActive
FROM inserted i
LEFT JOIN ref.PhotoDescriptionCode p ON i.Code = p.Code AND p.PhotoSOPID = 2
WHERE p.Code IS NULL




GO



CREATE TRIGGER [lookup].[LifeFormDelete]
ON [lookup].[LifeForm]
AFTER DELETE
AS 
-- Check if deleted code is being used as a photo description. If it is, don't delete the code from the lookup.
-- Otherwise, delete the code from the lookup and from ref.PhotoDescriptionCode.
IF EXISTS (
	SELECT *
	FROM deleted d
	INNER JOIN ref.PhotoDescriptionCode p ON d.Code = p.Code 
	INNER JOIN data.Photo ph ON ph.PhotoDescriptionCodeID = p.ID
	WHERE p.PhotoSOPID = 2
	)
	BEGIN
		RAISERROR ('Cannot delete life form code(s). One or more of these codes is also being used as a photo description code.', 10, 1);
		ROLLBACK TRANSACTION;
	END
ELSE
	BEGIN
		DELETE FROM ref.PhotoDescriptionCode
		WHERE EXISTS
			(SELECT *
			 FROM deleted
			 WHERE deleted.Code = PhotoDescriptionCode.Code AND PhotoDescriptionCode.PhotoSOPID = 2);
	END



GO



CREATE TRIGGER [lookup].[LifeFormUpdate]
ON [lookup].[LifeForm]
AFTER UPDATE
AS 
-- Check if a) the code is being changed and b) the code is being used in a photo record. If this is the case, prevent the update.
IF EXISTS (
	SELECT *
	FROM deleted d
	INNER JOIN inserted i ON d.ID = i.ID
	INNER JOIN ref.PhotoDescriptionCode p ON d.Code = p.Code AND p.PhotoSOPID = 2
	INNER JOIN data.Photo ph ON ph.PhotoDescriptionCodeID = p.ID
	WHERE d.Code != i.Code
	)
	BEGIN
		RAISERROR ('Cannot change life form code(s). One or more of these codes is also being used as a photo description code.', 10, 1);
		ROLLBACK TRANSACTION;
	END
-- If the code isn't being changed or isn't being used in a photo record, update the corresponding row(s) in ref.PhotoDescriptionCode 
ELSE
	BEGIN
		UPDATE ref.PhotoDescriptionCode
		SET Label = (SELECT i.Label 
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 2),
			IsActive = (SELECT i.IsActive
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 2),
			Code = (SELECT i.Code 
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 2)
		WHERE EXISTS
			(SELECT * 
			FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
			WHERE ref.PhotoDescriptionCode.Code = d.Code AND ref.PhotoDescriptionCode.PhotoSOPID = 2);
	END



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of riparian vegetation, split into broad and easily identifiable classes', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Descriptive label', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'Label';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Additional details', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'Summary';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Short code/abbreviation', @level0type = N'SCHEMA', @level0name = N'lookup', @level1type = N'TABLE', @level1name = N'LifeForm', @level2type = N'COLUMN', @level2name = N'Code';

