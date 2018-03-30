CREATE TABLE [ref].[Taxon] (
    [ID]                            INT           IDENTITY (1, 1) NOT NULL,
    [USDAPlantsCode]                VARCHAR (10)  NOT NULL,
    [ScientificName]                VARCHAR (50)  NOT NULL,
    [CommonName]                    VARCHAR (50)  NOT NULL,
    [Invasive]                      BIT           NULL,
    [TaxonomicReferenceAuthorityID] INT           NOT NULL,
    [DateCreated]                   DATETIME2 (0) CONSTRAINT [DF_Species_DateCreated] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Species] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [CK_Taxon_CommonName_DisallowZeroLength] CHECK (len([CommonName])>(0)),
    CONSTRAINT [CK_Taxon_ScientificName_DisallowZeroLength] CHECK (len([ScientificName])>(0)),
    CONSTRAINT [CK_Taxon_USDAPlantsCode_DisallowZeroLength] CHECK (len([USDAPlantsCode])>(0)),
    CONSTRAINT [FK_Taxon_TaxonomicReferenceAuthority] FOREIGN KEY ([TaxonomicReferenceAuthorityID]) REFERENCES [lookup].[TaxonomicReferenceAuthority] ([ID]),
    CONSTRAINT [UN_Taxon_USDAPlantsCode] UNIQUE NONCLUSTERED ([USDAPlantsCode] ASC)
);


GO
CREATE TRIGGER [ref].[TaxonInsert]
ON ref.Taxon
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
	i.USDAPlantsCode,
	i.ScientificName,
	1 AS IsMonitoringPhoto,
	3 AS PhotoSOPID,
	1 AS IsActive
FROM inserted i
LEFT JOIN ref.PhotoDescriptionCode p ON i.USDAPlantsCode = p.Code AND p.PhotoSOPID = 3
WHERE p.Code IS NULL AND i.Invasive = 1

GO
CREATE TRIGGER [ref].[TaxonDelete]
ON ref.Taxon
AFTER DELETE
AS 
-- Check if deleted code is being used as a photo description. If it is, don't delete the code from the lookup.
-- Otherwise, delete the code from the lookup and from ref.PhotoDescriptionCode.
IF EXISTS (
	SELECT *
	FROM deleted d
	INNER JOIN ref.PhotoDescriptionCode p ON d.USDAPlantsCode = p.Code 
	INNER JOIN data.Photo ph ON ph.PhotoDescriptionCodeID = p.ID
	WHERE p.PhotoSOPID = 3
	)
	BEGIN
		RAISERROR ('Cannot delete plant code(s). One or more of these codes is also being used as a photo description code.', 10, 1);
		ROLLBACK TRANSACTION;
	END
ELSE
	BEGIN
		DELETE FROM ref.PhotoDescriptionCode
		WHERE EXISTS
			(SELECT *
			 FROM deleted
			 WHERE deleted.USDAPlantsCode = PhotoDescriptionCode.Code AND PhotoDescriptionCode.PhotoSOPID = 3);
	END

GO
CREATE TRIGGER [ref].[TaxonUpdate]
ON ref.Taxon
AFTER UPDATE
AS 
-- Check if a) the code is being changed and b) the code is being used in a photo record. If this is the case, prevent the update.
IF EXISTS (
	SELECT *
	FROM deleted d
	INNER JOIN inserted i ON d.ID = i.ID
	INNER JOIN ref.PhotoDescriptionCode p ON d.USDAPlantsCode = p.Code AND p.PhotoSOPID = 3
	INNER JOIN data.Photo ph ON ph.PhotoDescriptionCodeID = p.ID
	WHERE d.USDAPlantsCode != i.USDAPlantsCode
	)
	BEGIN
		RAISERROR ('Cannot change taxon code(s). One or more of these codes is also being used as a photo description code.', 10, 1);
		ROLLBACK TRANSACTION;
	END
ELSE
	-- If the code isn't being changed or isn't being used in a photo record, update the corresponding row(s) in ref.PhotoDescriptionCode 
	BEGIN
		UPDATE ref.PhotoDescriptionCode
		SET Label = (SELECT i.ScientificName 
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.USDAPlantsCode AND ref.PhotoDescriptionCode.PhotoSOPID = 3),
			IsActive = (SELECT i.Invasive
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.USDAPlantsCode AND ref.PhotoDescriptionCode.PhotoSOPID = 3),
			Code = (SELECT i.USDAPlantsCode 
					FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
					WHERE ref.PhotoDescriptionCode.Code = d.USDAPlantsCode AND ref.PhotoDescriptionCode.PhotoSOPID = 3)
		WHERE EXISTS
			(SELECT * 
			FROM inserted i INNER JOIN deleted d ON i.ID = d.ID
			WHERE ref.PhotoDescriptionCode.Code = d.USDAPlantsCode AND ref.PhotoDescriptionCode.PhotoSOPID = 3);
	
		-- If there are invasives that aren't in ref.PhotoDescriptionCode, insert them
		IF EXISTS (
			SELECT *
			FROM deleted d
			INNER JOIN inserted i ON d.ID = i.ID
			LEFT JOIN ref.PhotoDescriptionCode p ON d.USDAPlantsCode = p.Code AND p.PhotoSOPID = 3
			WHERE p.ID IS NULL AND i.Invasive = 1
			)
		BEGIN
			INSERT INTO ref.PhotoDescriptionCode (
				Code,
				Label,
				IsMonitoringPhoto,
				PhotoSOPID,
				IsActive
				)
			SELECT
				i.USDAPlantsCode,
				i.ScientificName,
				1 AS IsMonitoringPhoto,
				3 AS PhotoSOPID,
				i.Invasive AS IsActive
			FROM deleted d
			INNER JOIN inserted i ON d.ID = i.ID
			LEFT JOIN ref.PhotoDescriptionCode p ON d.USDAPlantsCode = p.Code AND p.PhotoSOPID = 3
			WHERE p.ID IS NULL AND i.Invasive = 1
		END
	END

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Species list', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key for this table', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'USDA plant code assigned to taxon', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'USDAPlantsCode';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Species scientific name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'ScientificName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Species common name', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'CommonName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Indicates whether species is considered invasive', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'Invasive';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Foreign key to lookup.TaxonomicReferenceAuthority (reference or authority used in species identification)', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'TaxonomicReferenceAuthorityID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date the record was created', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'TABLE', @level1name = N'Taxon', @level2type = N'COLUMN', @level2name = N'DateCreated';

