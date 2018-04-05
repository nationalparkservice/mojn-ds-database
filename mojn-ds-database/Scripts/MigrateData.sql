/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

USE MOJN_DS_Dev;
GO
----------------------------------
--lookup.PhotoSOP
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.PhotoSOP)
BEGIN
	SET IDENTITY_INSERT lookup.PhotoSOP ON;
	INSERT INTO lookup.PhotoSOP (
		ID,
		Code,
		Label,
		Summary
	)
	VALUES
	(1, N'RPT', N'Repeat Photos', NULL),
	(2, N'RVG', N'Riparian Veg', NULL),
	(3, N'INV', N'Invasives', NULL),
	(4, N'WLD', N'Wildlife', NULL),
	(5, N'DSC', N'Discharge', NULL),
	(6, N'DST', N'Disturbance', NULL),
	(7, N'SEN', N'Sensor', NULL),
	(8, N'WQU', N'Water Quality', NULL),
	(9, N'MSC', N'Miscellaneous', NULL);
	SET IDENTITY_INSERT lookup.PhotoSOP OFF;
END
GO

----------------------------------
--lookup.DataProcessingLevel
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.DataProcessingLevel)
BEGIN
	SET IDENTITY_INSERT lookup.DataProcessingLevel ON;
	INSERT INTO lookup.DataProcessingLevel (
		ID,
		Code,
		Label,
		Summary,
		IsActive,
		ProcessOrder
	)
	VALUES 
	(1, N'R', N'Raw', N'Data in their state of original collection, either in the form of paper or electronic field forms, eletronic sensor files, or digital media(photo, video, or audio). These data generally have been collected following some QA procedures, but have not undergone any QC procedures.', 1, 10),
	(2, N'P', N'Provisional', N'Data that have undergone all planned QA procedures, have been entered into the system of record, and have passed verification procedures to ensure that data in the system of record match source data (field forms, sensor data files, etc.). Provisional data have not undergone all QC procedures', 1, 20),
	(3, N'A', N'Accepted', N'Data that have undergone all QA and QC procedures as defined in a published protocol and associated SOPs. Used in cases where a Quality Assurance Plan has not been developed and approved.', 1, 30);
	SET IDENTITY_INSERT lookup.DataProcessingLevel OFF;
END
GO

----------------------------------
--lookup.DataQualityFlag
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.DataQualityFlag)
BEGIN
	SET IDENTITY_INSERT lookup.DataQualityFlag ON;
	INSERT INTO lookup.DataQualityFlag (
		ID,
		Code,
		Label,
		Summary,
		IsActive,
		SortOrder
	)
	VALUES 
	(1, N'NF', N'No Flag', N'No data quality flag associated with this record', 1, 1),
	(2, N'I', N'Information', N'There is additional information associated with this record', 1, 2),
	(3, N'W', N'Warning', N'Care should be taken when including this record in data analysis', 1, 3),
	(4, N'C', N'Critical', N'There are serious concerns about the quality of this record', 1, 4);
	SET IDENTITY_INSERT lookup.DataQualityFlag OFF;
END
GO

----------------------------------
--lookup.DischargeEstimatedFlag
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.DischargeEstimatedFlag)
BEGIN
	SET IDENTITY_INSERT lookup.DischargeEstimatedFlag ON;
	INSERT INTO lookup.DischargeEstimatedFlag (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.EstimatedDischargeFlag;
	SET IDENTITY_INSERT lookup.DischargeEstimatedFlag OFF;
END
GO

----------------------------------
--lookup.DisturbanceClass
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.DisturbanceClass)
BEGIN
	SET IDENTITY_INSERT lookup.DisturbanceClass ON;
	INSERT INTO lookup.DisturbanceClass (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.DisturbanceClass;
	SET IDENTITY_INSERT lookup.DisturbanceClass OFF;
END
GO

----------------------------------
--lookup.FlowCondition
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.FlowCondition)
BEGIN
	SET IDENTITY_INSERT lookup.FlowCondition ON;
	INSERT INTO lookup.FlowCondition (
		ID,
		Label,
		Sort
	)
	SELECT
		ID,
		Label,
		Sort
	FROM MOJN_DS.lookup.FlowCondition;
	SET IDENTITY_INSERT lookup.FlowCondition OFF;
END
GO

----------------------------------
--lookup.FlowModificationStatus
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.FlowModificationStatus)
BEGIN
	SET IDENTITY_INSERT lookup.FlowModificationStatus ON;
	INSERT INTO lookup.FlowModificationStatus (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.FlowModificationStatus;
	SET IDENTITY_INSERT lookup.FlowModificationStatus OFF;
END
GO

----------------------------------
--lookup.GRTSDraw
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.GRTSDraw)
BEGIN
	SET IDENTITY_INSERT lookup.GRTSDraw ON;
	INSERT INTO lookup.GRTSDraw (
		ID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		Label,
		NULL as Summary
	FROM MOJN_DS.lookup.GRTSDraw;
	SET IDENTITY_INSERT lookup.GRTSDraw OFF;
END
GO

----------------------------------
--lookup.GRTSPanel
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.GRTSPanel)
BEGIN
	SET IDENTITY_INSERT lookup.GRTSPanel ON;
	INSERT INTO lookup.GRTSPanel (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.GRTSPanel;
	SET IDENTITY_INSERT lookup.GRTSPanel OFF;
END
GO

----------------------------------
--lookup.GRTSStatus
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.GRTSStatus)
BEGIN
	SET IDENTITY_INSERT lookup.GRTSStatus ON;
	INSERT INTO lookup.GRTSStatus (
		ID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		Label,
		NULL as Summary
	FROM MOJN_DS.lookup.GRTSStatus;
	SET IDENTITY_INSERT lookup.GRTSStatus OFF;
END
GO

----------------------------------
--lookup.HorizontalDatum
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.HorizontalDatum)
BEGIN
	SET IDENTITY_INSERT lookup.HorizontalDatum ON;
	INSERT INTO lookup.HorizontalDatum (
		ID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		Label,
		Summary
	FROM MOJN_DS.lookup.HorizontalDatum;
	SET IDENTITY_INSERT lookup.HorizontalDatum OFF;
END
GO

----------------------------------
--lookup.InvasivesObserved
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.InvasivesObserved)
BEGIN
	SET IDENTITY_INSERT lookup.InvasivesObserved ON;
	INSERT INTO lookup.InvasivesObserved (
		ID,
		Code,
		Label
	)
	VALUES
	(1, N'Y', N'Yes'),
	(2, N'N', N'No'),
	(9, N'ND', N'No Data');
	SET IDENTITY_INSERT lookup.InvasivesObserved OFF;
END
GO

----------------------------------
--lookup.IsDownloadSuccessful
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.IsDownloadSuccessful)
BEGIN
	SET IDENTITY_INSERT lookup.IsDownloadSuccessful ON;
	INSERT INTO lookup.IsDownloadSuccessful (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.IsDownloadSuccessful;
	SET IDENTITY_INSERT lookup.IsDownloadSuccessful OFF;
END
GO

----------------------------------
--lookup.IsLibraryPhoto
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.IsLibraryPhoto)
BEGIN
	SET IDENTITY_INSERT lookup.IsLibraryPhoto ON;
	INSERT INTO lookup.IsLibraryPhoto (
		ID,
		Code,
		Label
	)
	VALUES
	(1, N'Y', N'Yes'),
	(2, N'N', N'No'),
	(8, N'NA', N'Not Applicable'),
	(9, N'ND', N'No Data');
	SET IDENTITY_INSERT lookup.IsLibraryPhoto OFF;
END
GO

----------------------------------
--lookup.IsSensorRetrieved
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.IsSensorRetrieved)
BEGIN
	SET IDENTITY_INSERT lookup.IsSensorRetrieved ON;
	INSERT INTO lookup.IsSensorRetrieved (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.IsSensorRetrieved;
	SET IDENTITY_INSERT lookup.IsSensorRetrieved OFF;
END
GO

----------------------------------
--lookup.IsVegetationObserved
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.IsVegetationObserved)
BEGIN
	SET IDENTITY_INSERT lookup.IsVegetationObserved ON;
	INSERT INTO lookup.IsVegetationObserved (
		ID,
		Code,
		Label
	)
	VALUES
	(1, N'Y', N'Yes'),
	(2, N'N', N'No'),
	(9, N'ND', N'No Data');
	SET IDENTITY_INSERT lookup.IsVegetationObserved OFF;
END
GO

----------------------------------
--lookup.IsWildlifeObserved
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.IsWildlifeObserved)
BEGIN
	SET IDENTITY_INSERT lookup.IsWildlifeObserved ON;
	INSERT INTO lookup.IsWildlifeObserved (
		ID,
		Code,
		Label
	)
	VALUES
	(1, N'Y', N'Yes'),
	(2, N'N', N'No'),
	(9, N'ND', N'No Data');
	SET IDENTITY_INSERT lookup.IsWildlifeObserved OFF;
END
GO

----------------------------------
--lookup.LifeForm
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.LifeForm)
BEGIN
	SET IDENTITY_INSERT lookup.LifeForm ON;
	INSERT INTO lookup.LifeForm (
		ID,
		Label,
		Summary,
		Code
	)
	VALUES
	(N'1', N'Woody >4m', N'Woody vasuclar plant with single stem (trunk) or multi-stemmed growth form >4m tall. Always perennial.', N'WOODGT4'),
	(N'2', N'Woody 2-4m', N'Woody vasuclar plant with single stem (trunk) or multi-stemmed growth form 2-4m tall. Always perennial.', N'WOOD2TO4'),
	(N'3', N'Woody <2m', N'Woody vasuclar plant with single stem (trunk) or multi-stemmed growth form <2m tall. Stems may be woody or herbaceous above the ground, but there is significant woody tissue at the ground. Always perennial.', N'WOODLT2'),
	(N'4', N'Forb', N'Herbaceous vascular plant without significant woody tissue above or at the ground. Annual or perennial. Excludes graminoids. Includes ferns, lycopods, and horsetails.', N'FORB'),
	(N'5', N'Grass', N'Graminoid characterized by hollow, round stems in cross-section, solid nodes, alternate leaves, and hairy ligules.', N'GRASS'),
	(N'6', N'Rush', N'Graminoid characterized by pithy, round stems in cross-section.', N'RUSH'),
	(N'7', N'Sedge', N'Graminoid characterized by triangular stems in cross-section and spirally arranged leaves.', N'SEDGE'),
	(N'8', N'Cattail', N'Graminoid characterized by brownish, compact, hotdog-shaped inflorescences.', N'CATT'),
	(N'9', N'Bryophyte', N'Herbaceous nonvascular plant, including mosses, hornworts, and liverworts.', N'BRYO'),
	(N'10', N'Non-Plant', N'Organism that may or may not be photosynthetic, including algae, bacteria, fungi, and lichens.', N'NON'),
	(N'11', N'Reed', N'Graminoid characterized by ....', N'REED');
	SET IDENTITY_INSERT lookup.LifeForm OFF;
END
GO

----------------------------------
--lookup.MistletoePresent
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.MistletoePresent)
BEGIN
	SET IDENTITY_INSERT lookup.MistletoePresent ON;
	INSERT INTO lookup.MistletoePresent (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.MistletoePresent;
	SET IDENTITY_INSERT lookup.MistletoePresent OFF;
END
GO

----------------------------------
--lookup.ModificationType
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.ModificationType)
BEGIN
	SET IDENTITY_INSERT lookup.ModificationType ON;
	INSERT INTO lookup.ModificationType (
		ID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		Label,
		NULL AS Summary
	FROM MOJN_DS.lookup.ModificationType;
	SET IDENTITY_INSERT lookup.ModificationType OFF;
END
GO

----------------------------------
--lookup.MonitoringStatus
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.MonitoringStatus)
BEGIN
	SET IDENTITY_INSERT lookup.MonitoringStatus ON;
	INSERT INTO lookup.MonitoringStatus (
		ID,
		Code,
		AcceptanceCategory,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		AcceptanceCategory,
		Label,
		Summary
	FROM MOJN_DS.lookup.AcceptanceRejectionReason;
	SET IDENTITY_INSERT lookup.MonitoringStatus OFF;
END
GO

----------------------------------
--lookup.Park
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.Park)
BEGIN
	SET IDENTITY_INSERT lookup.Park ON;
	INSERT INTO lookup.Park (
		ID,
		Code,
		Label,
		ShortLabel
	)
	SELECT
		ID,
		Code,
		Label,
		ShortLabel
	FROM MOJN_DS.lookup.LandManagementUnit;
	SET IDENTITY_INSERT lookup.Park OFF;
END
GO

----------------------------------
--lookup.PersonnelActive
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.PersonnelActive)
BEGIN
	SET IDENTITY_INSERT lookup.PersonnelActive ON;
	INSERT INTO lookup.PersonnelActive (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.PersonnelActive;
	SET IDENTITY_INSERT lookup.PersonnelActive OFF;
END
GO

----------------------------------
--lookup.PersonnelRole
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.PersonnelRole)
BEGIN
	SET IDENTITY_INSERT lookup.PersonnelRole ON;
	INSERT INTO lookup.PersonnelRole (
		ID,
		Label,
		Summary
	)
	VALUES
	(1, N'Data entry', N'Entered data into the database'),
	(2, N'Data review', N'Checked data in database against data on field form'),
	(3, N'Data validation', N'Ensured that data in database are within reasonable ranges'),
	(4, N'Data certification', N'Certified that data are of appropriate quality for publication'),
	(5, N'Field crew', N'Participated in field data collection activities');
	SET IDENTITY_INSERT lookup.PersonnelRole OFF;
END
GO

----------------------------------
--lookup.ProtectedStatus
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.ProtectedStatus)
BEGIN
	SET IDENTITY_INSERT lookup.ProtectedStatus ON;
	INSERT INTO lookup.ProtectedStatus (
		ID,
		Code,
		Label,
		Summary
	)
	VALUES
	(1, N'LP', N'Legally Protected', N'Covered under existing statue as being exempt from public dissemination'),
	(2, N'OP', N'Operationally Protected', N'Data withheld from release to protect resources or site fidelity but may be subject to release upon request'),
	(3, N'NP', N'Not Protected', N'Data is neither legally nor operationally sensitive and therefore does not have any distribution restrictions conditional on protected status'),
	(4, N'NA', N'Not Available', N'Not Available');
	SET IDENTITY_INSERT lookup.ProtectedStatus OFF;
END
GO

----------------------------------
--lookup.RepeatPhotoType
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.RepeatPhotoType)
BEGIN
	SET IDENTITY_INSERT lookup.RepeatPhotoType ON;
	INSERT INTO lookup.RepeatPhotoType (
		ID,
		Code,
		Label
	)
	VALUES
	(0, N'DNSTR', N'Looking Downstream'),
	(1, N'SOURCE', N'Source'),
	(2, N'UPSTR', N'Looking Upstream'),
	(3, N'OTHER', N'Other'),
	(4, N'REJECT', N'Reject'),
	(5, N'SENSOR', N'Sensor')
	SET IDENTITY_INSERT lookup.RepeatPhotoType OFF;
END
GO

----------------------------------
--lookup.RiparianVegetationBuffer
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.RiparianVegetationBuffer)
BEGIN
	SET IDENTITY_INSERT lookup.RiparianVegetationBuffer ON;
	INSERT INTO lookup.RiparianVegetationBuffer (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.RiparianVegBuffer;
	SET IDENTITY_INSERT lookup.RiparianVegetationBuffer OFF;
END
GO

----------------------------------
--lookup.SensorProblem
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.SensorProblem)
BEGIN
	SET IDENTITY_INSERT lookup.SensorProblem ON;
	INSERT INTO lookup.SensorProblem (
		ID,
		Label,
		Summary
	)
	SELECT
		ID,
		Label,
		Description
	FROM MOJN_DS.lookup.SensorProblem;
	SET IDENTITY_INSERT lookup.SensorProblem OFF;
END
GO

----------------------------------
--lookup.SpecificConductanceFlag
----------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'SpecificConductanceFlag')
BEGIN
	DROP TABLE lookup.SpecificConductanceFlag;
END
GO

----------------------------------
--lookup.SpringbrookLengthFlag
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.SpringbrookLengthFlag)
BEGIN
	SET IDENTITY_INSERT lookup.SpringbrookLengthFlag ON;
	INSERT INTO lookup.SpringbrookLengthFlag (
		ID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		Label,
		Summary
	FROM MOJN_DS.lookup.SpringbrookLengthFlag;
	SET IDENTITY_INSERT lookup.SpringbrookLengthFlag OFF;
END
GO

----------------------------------
--lookup.SpringType
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.SpringType)
BEGIN
	SET IDENTITY_INSERT lookup.SpringType ON;
	INSERT INTO lookup.SpringType (
		ID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		Label,
		Summary
	FROM MOJN_DS.lookup.SpringType;
	SET IDENTITY_INSERT lookup.SpringType OFF;
END
GO

----------------------------------
--lookup.Subunit
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.Subunit)
BEGIN
	SET IDENTITY_INSERT lookup.Subunit ON;
	INSERT INTO lookup.Subunit (
		ID,
		ParkID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		LandManagementUnitID,
		Code,
		Label,
		Summary
	FROM MOJN_DS.lookup.Subunit;
	SET IDENTITY_INSERT lookup.Subunit OFF;
END
GO

----------------------------------
--lookup.TaxonomicStandard
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.TaxonomicStandard)
BEGIN
	SET IDENTITY_INSERT lookup.TaxonomicStandard ON;
	INSERT INTO lookup.TaxonomicStandard (
		ID,
		Code,
		Label,
		Summary
	)
	VALUES
	(1, N'F', N'Field Subject Matter Expert', N'Use if/when data are collected in the field or verified in the office to one or more undetermined standards.  Record the position(s) responsible for performing the identifications as the reference/authority.'),
	(2, N'T', N'Taxonomic Subject Matter Expert', N'Use if/when data are collected and verified by an individual with documented taxonomic expertise.  Record the name and organization of taxonomic subject matter expert as the reference/authority.'),
	(3, N'S', N'Scientific Publication', N'Use if there is a Scientific Publication that serves as the reference for identification or reporting.  Record the publication reference and year of publication (to distinguish among versions) as the reference/authority.'),
	(4, N'NA', N'Not Available', N'Not Available');
	SET IDENTITY_INSERT lookup.TaxonomicStandard OFF;
END
GO

----------------------------------
--lookup.TaxonomicReferenceAuthority
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.TaxonomicReferenceAuthority)
BEGIN
	SET IDENTITY_INSERT lookup.TaxonomicReferenceAuthority ON;
	INSERT INTO lookup.TaxonomicReferenceAuthority (
		ID,
		TaxonomicStandardID,
		Label,
		Summary
	)
	VALUES
	(1, 4, N'Not Available', N'Not Available'),
	(2, 3, N'Jepson (2002)', N'Baldwin, B. G, S. Boyd, B. J. Ertter, R. W. Patterson, T. J. Rosatti, D. H. Wilken, and M. Wetherwax. 2002. The Jepson desert manual: vascular plants of southeastern California. University of California Press, Berkeley, California.');
	SET IDENTITY_INSERT lookup.TaxonomicReferenceAuthority OFF;
END
GO

----------------------------------
--lookup.UTMZone
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.UTMZone)
BEGIN
	SET IDENTITY_INSERT lookup.UTMZone ON;
	INSERT INTO lookup.UTMZone (
		ID,
		Code,
		Label,
		Summary
	)
	VALUES
	(11, N'11', N'Zone 11', N'UTM Zone 11'),
	(12, N'12', N'Zone 12', N'UTM Zone 12'),
	(13, N'13', N'Zone 13', N'UTM Zone 13');
	SET IDENTITY_INSERT lookup.UTMZone OFF;
END
GO

----------------------------------
--lookup.VisitType
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.VisitType)
BEGIN
	SET IDENTITY_INSERT lookup.VisitType ON;
	INSERT INTO lookup.VisitType (
		ID,
		Code,
		Label,
		Summary
	)
	SELECT
		ID,
		Code,
		Label,
		Summary
	FROM MOJN_DS.lookup.SpringVisitType;
	SET IDENTITY_INSERT lookup.VisitType OFF;
END
GO

----------------------------------
--lookup.WaterQualityDataCollected
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.WaterQualityDataCollected)
BEGIN
	SET IDENTITY_INSERT lookup.WaterQualityDataCollected ON;
	INSERT INTO lookup.WaterQualityDataCollected(
		ID,
		Code,
		Label
	)
	VALUES
	(1, N'Y', N'Yes'),
	(3, N'NIW', N'No - Insufficient water'),
	(5, N'NO', N'No - Other reason'),
	(6, N'NU', N'No - Unknown reason');
	SET IDENTITY_INSERT lookup.WaterQualityDataCollected OFF;
END
GO

----------------------------------
--lookup.WaterTemperatureFlag
----------------------------------
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME LIKE 'WaterTemperatureFlag')
BEGIN
	DROP TABLE lookup.WaterTemperatureFlag;
END
GO

----------------------------------
--lookup.WildlifeEvidence
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.WildlifeEvidence)
BEGIN
	SET IDENTITY_INSERT lookup.WildlifeEvidence ON;
	INSERT INTO lookup.WildlifeEvidence (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.WildlifeEvidence;
	SET IDENTITY_INSERT lookup.WildlifeEvidence OFF;
END
GO

----------------------------------
--lookup.WildlifeType
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM lookup.WildlifeType)
BEGIN
	SET IDENTITY_INSERT lookup.WildlifeType ON;
	INSERT INTO lookup.WildlifeType (
		ID,
		Code,
		Label
	)
	SELECT
		ID,
		Code,
		Label
	FROM MOJN_DS.lookup.WildlifeTypes;
	SET IDENTITY_INSERT lookup.WildlifeType OFF;
END
GO

----------------------------------
--ref.Camera
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.Camera)
BEGIN
	SET IDENTITY_INSERT ref.Camera ON;
	INSERT INTO ref.Camera (
		ID,
		Label,
		Manufacturer,
		Model,
		NPSPropertyTag,
		Summary,
		SerialNumber,
		IsActive,
		SortOrder
	)
	SELECT
		ID,
		Label,
		Manufacturer,
		Model,
		MOJNEquipmentNbr AS NPSPropertyTag,
		Notes AS Summary,
		NULL AS SerialNumber,
		1 AS IsActive,
		SortOrder
	FROM MOJN_DS.lookup.Camera;
	SET IDENTITY_INSERT ref.Camera OFF;
END
GO

----------------------------------
--ref.CameraCard
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.CameraCard)
BEGIN
	SET IDENTITY_INSERT ref.CameraCard ON;
	INSERT INTO ref.CameraCard (
		ID,
		Label,
		Manufacturer,
		CardType,
		CardCapacityGB
	)
	SELECT
		ID,
		Label,
		Manufacturer,
		CardType,
		CardCapacityGB
	FROM MOJN_DS.lookup.CameraCard;
	SET IDENTITY_INSERT ref.CameraCard OFF;
END
GO

----------------------------------
--ref.GPSUnit
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.GPSUnit)
BEGIN
	SET IDENTITY_INSERT ref.GPSUnit ON;
	INSERT INTO ref.GPSUnit (
		ID,
		Label,
		Summary,
		IsActive,
		Model,
		Manufacturer
	)
	SELECT
		csu.ID,
		csu.Label,
		csu.Summary,
		1 AS IsActive,
		cs.Label AS Model,
		cs.Label AS Manufacturer
	FROM MOJN_DS.lookup.CoordinateSourceUnit as csu
	LEFT JOIN MOJN_DS.lookup.CoordinateSource as cs
	ON csu.CoordinateSourceModelID = cs.ID;
	SET IDENTITY_INSERT ref.GPSUnit OFF;
END
GO

----------------------------------
--ref.Taxon
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.Taxon)
BEGIN
	SET IDENTITY_INSERT ref.Taxon ON;
	INSERT INTO ref.Taxon (
		ID,
		USDAPlantsCode,
		ScientificName,
		CommonName,
		Invasive,
		TaxonomicReferenceAuthorityID,
		DateCreated
	)
	SELECT
		ID,
		USDAPlantsCode,
		ScientificName,
		CommonName,
		Invasive,
		1 AS TaxonomicReferenceAuthorityID,
		DateCreated
	FROM MOJN_DS.lookup.Species;
	SET IDENTITY_INSERT ref.Taxon OFF;
END
GO

----------------------------------
--ref.ParkTaxonProtectedStatus
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.ParkTaxonProtectedStatus)
BEGIN
	INSERT INTO ref.ParkTaxonProtectedStatus (
		TaxonID,
		ParkID,
		ProtectedStatusID
	)
	SELECT
		t.ID AS TaxonID,
		p.ID AS ParkID,
		4 AS ProtectedStatusID
	FROM ref.Taxon t
	CROSS JOIN lookup.Park p;
END
GO

----------------------------------
--ref.Personnel
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.Personnel)
BEGIN
	SET IDENTITY_INSERT ref.Personnel ON;
	INSERT INTO ref.Personnel (
		ID,
		Initials,
		FirstName,
		LastName,
		MiddleInitial,
		Organization,
		Notes,
		PersonnelActiveID,
		ProtectedStatusID
	)
	SELECT
		ID,
		Initials,
		FirstName,
		LastName,
		MiddleInitial,
		Organization,
		Notes,
		PersonnelActive,
		3 AS ProtectedStatusID
	FROM MOJN_DS.lookup.MOJNPersonnel;
	SET IDENTITY_INSERT ref.Personnel OFF;
END
GO

----------------------------------
--ref.Protocol
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.Protocol)
BEGIN
	SET IDENTITY_INSERT ref.Protocol ON;
	INSERT INTO ref.Protocol (
		ID,
		ProtocolName,
		Description,
		DataStoreReferenceCode,
		URL,
		BeginImplementationDate,
		EndImplementationDate,
		CreatedBy,
		LastModifiedBy,
		CreatedDate,
		LastModifiedDate
	)
	SELECT
		ID,
		ProtocolName,
		Description,
		DataStoreReferenceCode,
		URL,
		BeginImplementationDate,
		EndImplementationDate,
		CreatedBy,
		LastModifiedBy,
		CreatedDate,
		LastModifiedDate
	FROM MOJN_DS_AsDelivered.ref.ProtocolConfiguration;
	SET IDENTITY_INSERT ref.Protocol OFF;
END
GO

----------------------------------
--ref.SensorModel
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.SensorModel)
BEGIN
	SET IDENTITY_INSERT ref.SensorModel ON;
	INSERT INTO ref.SensorModel (
		ID,
		Label,
		Manufacturer,
		Model,
		Summary
	)
	SELECT
		ID,
		Label,
		Manufacturer,
		ProductID AS Model,
		Summary
	FROM MOJN_DS.lookup.SensorModel;
	SET IDENTITY_INSERT ref.SensorModel OFF;
END
GO

----------------------------------
--ref.Sensor
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.Sensor)
BEGIN
	SET IDENTITY_INSERT ref.Sensor ON;
	INSERT INTO ref.Sensor (
		ID,
		SensorModelID,
		SerialNumber,
		Label,
		Summary
	)
	SELECT
		ID,
		ModelID,
		Code AS SerialNumber,
		Label,
		Summary
	FROM MOJN_DS.lookup.Sensor;
	SET IDENTITY_INSERT ref.Sensor OFF;
END
GO

----------------------------------
--ref.WaterQualityInstrument
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.WaterQualityInstrument)
BEGIN
	SET IDENTITY_INSERT ref.WaterQualityInstrument ON;
	INSERT INTO ref.WaterQualityInstrument (
		ID,
		Label,
		Summary,
		Model,
		Manufacturer,
		NPSPropertyTag,
		IsActive
	)
	SELECT
		wq.ID,
		wq.Label,
		wq.Summary,
		wqm.Label AS Model,
		wqm.Manufacturer,
		NULL AS NPSPropertyTag,
		1 as IsActive
	FROM MOJN_DS.lookup.WaterQualityInstrument  AS wq
	LEFT JOIN MOJN_DS.lookup.WaterQualityInstrumentModel AS wqm ON wq.ModelID = wqm.ID;
	SET IDENTITY_INSERT ref.WaterQualityInstrument OFF;
END

------------------------------------
----ref.PhotoDescriptionCode
------------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM ref.PhotoDescriptionCode)
BEGIN
	INSERT INTO ref.PhotoDescriptionCode (
		Code,
		Label,
		PhotoSOPID,
		IsMonitoringPhoto,
		IsActive
	)
	SELECT
		Code,
		Label,
		1 AS PhotoSOPID,
		1 AS IsMonitoringPhoto,
		IsActive
	FROM lookup.RepeatPhotoType
	UNION
	SELECT
		Code,
		Label,
		2 AS PhotoSOPID,
		1 AS IsMonitoringPhoto,
		1 AS IsActive
	FROM lookup.LifeForm
	UNION
	SELECT
		USDAPlantsCode AS Code,
		ScientificName AS Label,
		3 AS PhotoSOPID,
		1 AS IsMonitoringPhoto,
		1 AS IsActive
	FROM ref.Taxon
	WHERE Invasive = 1
	UNION
	SELECT
		Code,
		Label,
		4 AS PhotoSOPID,
		1 AS IsMonitoringPhoto,
		1 AS IsActive
	FROM lookup.WildlifeType
	ORDER BY PhotoSOPID
END
GO


----------------------------------
--app.ConfigurationVariable
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM app.ConfigurationVariable)
BEGIN
	SET IDENTITY_INSERT app.ConfigurationVariable ON;
	INSERT INTO app.ConfigurationVariable (
		ID,
		Label,
		Value,
		Description
	)
	VALUES
	(1, N'PhotoShareDirectory', N'\\INPLAKE52V\ORG\MONITORING\DesertSprings\Data\Images', N'UNC of the network share where photos reside.'),
	(2, N'SiteInfoSheetShareDirectory', N'\\INPLAKE52V\ORG\MONITORING\DesertSprings\Implementation\SitePackets', N'UNC of the Site Information Sheet network share.'),
	(3, N'FieldNotesShareDirectory', N'\\INPLAKE52V\ORG\MONITORING\DesertSprings\Data\FieldData', N'UNC of the network share where field notes reside.');
	SET IDENTITY_INSERT app.ConfigurationVariable OFF;
END
GO

----------------------------------
--data.Site
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.Site)
BEGIN
	SET IDENTITY_INSERT data.Site ON;
	INSERT INTO data.Site (
		ID,
		ParkID,
		Name,
		Code,
		SubunitID,
		AccessDirections,
		GRTSNumber,
		Lat_WGS84,
		Lon_WGS84,
		X_UTM_NAD83_11N,
		Y_UTM_NAD83_11N,
		X_UTM_NAD83_12N,
		Y_UTM_NAD83_12N,
		ProtectedStatusID,
		GRTSDrawID,
		GRTSOrder,
		GRTSStatusID,
		GRTSPanelID,
		DateCreated
	)
	SELECT
		ID,
		LandManagementUnitID,
		SpringName,
		Code,
		SubunitID,
		AccessDirections,
		GRTSNumber,
		Lat_WGS84,
		Lon_WGS84,
		X_UTM_NAD83_11N,
		Y_UTM_NAD83_11N,
		X_UTM_NAD83_12N,
		Y_UTM_NAD83_12N,
		4 AS ProtectedStatusID,
		GRTSDrawID,
		GRTSOrder,
		GRTSStatusID,
		GRTSPanelID,
		DateCreated
	FROM MOJN_DS.dbo.SpringLocation;
	SET IDENTITY_INSERT data.Site OFF;
END
GO

----------------------------------
--data.Visit
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.Visit)
BEGIN
	SET IDENTITY_INSERT data.Visit ON;
	INSERT INTO data.Visit (
		ID,
		SiteID,
		VisitDate,
		StartTime,
		Notes,
		SpringTypeID,
		VisitTypeID,
		QAQCNotes,
		MonitoringStatusID,
		ProtocolID,
		ProtectedStatusID,
		DataReviewNotes,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		slv.ID,
		slv.SpringLocationID,
		slv.VisitDateStart,
		slv.VisitTimeStart,
		slv.Comments,
		slv.SpringTypeID,
		slv.SpringVisitTypeID,
		slv.QAQCNotes,
		ar.AcceptanceRejectionReasonID as MonitoringStatusID,
		1 AS ProtocolID,
		4 AS ProtectedStatusID,
		dr.Comments AS DataReviewNotes,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		dr.Comments AS DataProcessingLevelNote,
		slv.DateCreated
	FROM MOJN_DS.dbo.SpringLocationVisit as slv
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit_AcceptanceRejection AS ar ON ar.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.Visit OFF;
END
GO

----------------------------------
--data.CalibrationDO
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.CalibrationDO)
BEGIN
	SET IDENTITY_INSERT data.CalibrationDO ON;
	INSERT INTO data.CalibrationDO (
		ID,
		CalibrationTime,
		CalibrationDate,
		PreCalibrationReading_percent,
		PreCalibrationTemperature_C,
		PostCalibrationReading_percent,
		PostCalibrationTemperature_C,
		BarometricPressure_mmHg,
		DOInstrumentID,
		Notes,
		DateCreated
	)
	SELECT
		cal.ID,
		slv.VisitTimeStart AS CalibrationTime,
		slv.VisitDateStart AS CalibrationDate,
		cal.PreCalibrationReading_percent,
		cal.PreCalibrationTemperature_C,
		cal.PostCalibrationReading_percent,
		cal.PostCalibrationTemperature_C,
		cal.BarometricPressure_mmHg,
		wq.InstrumentID AS DOInstrumentID,
		'Migrated 03/20/2018. Visit date and time used for calibration date and time.' AS Notes,
		cal.DateCreated
	FROM MOJN_DS.dbo.CalibrationDissolvedOxygen AS cal
	LEFT JOIN MOJN_DS.dbo.InstrumentWaterQualityCalibration AS ical ON cal.InstrumentWaterQualityCalibrationID = ical.ID
	LEFT JOIN MOJN_DS.dbo.WaterQualityEvent AS wq ON ical.WaterQualityEventID = wq.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON wq.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.CalibrationDO OFF;
END
GO

----------------------------------
--data.CalibrationpH
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.CalibrationpH)
BEGIN
	SET IDENTITY_INSERT data.CalibrationpH ON;
	INSERT INTO data.CalibrationpH (
		ID,
		CalibrationTime,
		CalibrationDate,
		StandardValue_pH,
		PreCalibrationReading_pH,
		PreCalibrationTemperature_C,
		PostCalibrationReading_pH,
		PostCalibrationTemperature_C,
		pHInstrumentID,
		Notes,
		DateCreated
	)
	SELECT
		cal.ID,
		slv.VisitTimeStart AS CalibrationTime,
		slv.VisitDateStart AS CalibrationDate,
		cal.StandardValue_pH,
		cal.PreCalibrationReading_pH,
		cal.PreCalibrationTemperature_C,
		cal.PostCalibrationReading_pH,
		cal.PostCalibrationTemperature_C,
		wq.pHInstrumentID AS pHInstrumentID,
		'Migrated 03/20/2018. Visit date and time used for calibration date and time.' AS Notes,
		cal.DateCreated
	FROM MOJN_DS.dbo.Calibration_pH AS cal
	LEFT JOIN MOJN_DS.dbo.InstrumentWaterQualityCalibration AS ical ON cal.InstrumentWaterQualityCalibrationID = ical.ID
	LEFT JOIN MOJN_DS.dbo.WaterQualityEvent AS wq ON ical.WaterQualityEventID = wq.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON wq.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.CalibrationpH OFF;
END
GO

----------------------------------
--data.CalibrationSpCond
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.CalibrationSpCond)
BEGIN
	SET IDENTITY_INSERT data.CalibrationSpCond ON;
	INSERT INTO data.CalibrationSpCond (
		ID,
		CalibrationTime,
		CalibrationDate,
		StandardValue_microS_per_cm,
		PreCalibrationReading_microS_per_cm,
		PostCalibrationReading_microS_per_cm,
		SpCondInstrumentID,
		Notes,
		DateCreated
	)
	SELECT
		cal.ID,
		slv.VisitTimeStart AS CalibrationTime,
		slv.VisitDateStart AS CalibrationDate,
		cal.StandardValue_microsiemens_per_cm,
		cal.PreCalibrationReading_microsiemens_per_cm,
		cal.PostCalibrationReading_microsiemens_per_cm,
		wq.InstrumentID AS SpCondInstrumentID,
		'Migrated 03/20/2018. Visit date and time used for calibration date and time.' AS Notes,
		cal.DateCreated
	FROM MOJN_DS.dbo.CalibrationSpecificConductivity AS cal
	LEFT JOIN MOJN_DS.dbo.InstrumentWaterQualityCalibration AS ical ON cal.InstrumentWaterQualityCalibrationID = ical.ID
	LEFT JOIN MOJN_DS.dbo.WaterQualityEvent AS wq ON ical.WaterQualityEventID = wq.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON wq.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.CalibrationSpCond OFF;
END
GO

----------------------------------
--data.DischargeActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.DischargeActivity)
BEGIN
	INSERT INTO data.DischargeActivity (
		VisitID,
		FlowConditionID,
		Notes,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		slv.ID,
		slv.FlowConditionID,
		slv.WaterQuantityComments as Notes,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		slv.DateCreated
	FROM MOJN_DS.dbo.SpringLocationVisit as slv
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit_AcceptanceRejection AS ar ON ar.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.lookup.AcceptanceRejectionReason arr
	ON ar.AcceptanceRejectionReasonID = arr.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID
	WHERE arr.AcceptanceCategory = 'Accepted';
	SET IDENTITY_INSERT data.DischargeActivity OFF;
END
GO

----------------------------------
--data.DischargeEstimatedObservation
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.DischargeEstimatedObservation)
BEGIN
	SET IDENTITY_INSERT data.DischargeEstimatedObservation ON;
	INSERT INTO data.DischargeEstimatedObservation (
		ID,
		DischargeActivityID,
		Discharge_L_per_min,
		DischargeEstimatedFlagID,
		DateCreated
	)
	SELECT
		dchg.ID,
		da.ID AS DischargeActivityID,
		dchg.Discharge_LitersPerMinute,
		dchg.EstimatedDischargeFlagID,
		dchg.DateCreated
	FROM MOJN_DS.dbo.EstimatedDischarge AS dchg
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON dchg.SpringLocationVisitID = slv.ID
	LEFT JOIN data.DischargeActivity AS da ON da.VisitID = slv.ID;
	SET IDENTITY_INSERT data.DischargeEstimatedObservation OFF;
END
GO

----------------------------------
--data.DischargeVolumetricObservation
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.DischargeVolumetricObservation)
BEGIN
	SET IDENTITY_INSERT data.DischargeVolumetricObservation ON;
	INSERT INTO data.DischargeVolumetricObservation (
		ID,
		DischargeActivityID,
		ContainerVolume_mL,
		FillTime_seconds,
		MeasurementTimeOfDay,
		EstimatedCapture_percent,
		DateCreated
	)
	SELECT
		dchg.ID,
		da.ID AS DischargeActivityID,
		dchg.ContainerVolume_mL,
		dchg.FillTime_seconds,
		dchg.MeasurementTimeOfDay,
		dchg.EstimatedCapture_percent,
		dchg.DateCreated
	FROM MOJN_DS.dbo.VolumetricDischarge AS dchg
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON dchg.SpringLocationVisitID = slv.ID
	LEFT JOIN data.DischargeActivity AS da ON da.VisitID = slv.ID;
	SET IDENTITY_INSERT data.DischargeVolumetricObservation OFF;
END
GO

----------------------------------
--data.DisturbanceActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.DisturbanceActivity)
BEGIN
	SET IDENTITY_INSERT data.DisturbanceActivity ON;
	INSERT INTO data.DisturbanceActivity (
		ID,
		VisitID,
		FlowModificationStatusID,
		Roads,
		HumanUse,
		PlantManagement,
		HikingTrails,
		Livestock,
		OtherAnthropogenic,
		Fire,
		Flooding,
		Wildlife,
		OtherNatural,
		Overall,
		Notes,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		d.ID,
		d.SpringLocationVisitID,
		d.FlowModificationStatusID,
		d.Roads,
		d.HumanUse,
		d.PlantManagement,
		d.HikingTrails,
		d.Livestock,
		d.OtherAnthropogenic,
		d.Fire,
		d.Flooding,
		d.Wildlife,
		d.OtherNatural,
		d.Overall,
		d.Notes,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		d.DateCreated
	FROM MOJN_DS.dbo.Disturbance AS d
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON slv.ID = d.SpringLocationVisitID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.DisturbanceActivity OFF;
END
GO

----------------------------------
--data.DisturbanceFlowModification
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.DisturbanceFlowModification)
BEGIN
	SET IDENTITY_INSERT data.DisturbanceFlowModification ON;
	INSERT INTO data.DisturbanceFlowModification (
		ID,
		DisturbanceActivityID,
		ModificationTypeID,
		DateCreated
	)
	SELECT
		ID,
		DisturbanceID,
		ModificationType,
		DateCreated
	FROM MOJN_DS.dbo.DisturbanceModifications;
	SET IDENTITY_INSERT data.DisturbanceFlowModification OFF;
END
GO

----------------------------------
--data.InvasivesActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.InvasivesActivity)
BEGIN
	INSERT INTO data.InvasivesActivity (
		VisitID,
		InvasivesObservedID,
		Notes,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		slv.ID,
		IIF(MAX(i.ID) IS NULL, 2, 1) AS InvasivesObservedID,
		slv.InvasivesComments as Notes,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		slv.DateCreated
	FROM MOJN_DS.dbo.SpringLocationVisit as slv
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit_AcceptanceRejection AS ar ON ar.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.lookup.AcceptanceRejectionReason AS arr
	ON ar.AcceptanceRejectionReasonID = arr.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.Invasives AS i ON i.SpringLocationVisitID = slv.ID
	WHERE arr.AcceptanceCategory = 'Accepted'
	GROUP BY slv.ID, slv.InvasivesComments, dr.PassedReview, slv.DateCreated;
END
GO

----------------------------------
--data.InvasivesObservation
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.InvasivesObservation)
BEGIN
	SET IDENTITY_INSERT data.InvasivesObservation ON;
	INSERT INTO data.InvasivesObservation (
		ID,
		InvasivesActivityID,
		TaxonID,
		SpeciesNotes,
		RiparianVegetationBufferID,
		UtmX_m,
		UtmY_m,
		HorizontalDatumID,
		UTMZoneID,
		GPSUnitID,
		ProtectedStatusID,
		TaxonomicReferenceAuthorityID,
		DateCreated
	)
	SELECT
		i.ID,
		ia.ID AS InvasivesActivityID,
		i.SpeciesID AS TaxonID,
		i.SpeciesNotes,
		i.RiparianVegBuffer,
		sl.UtmX_m,
		sl.UtmY_m,
		sl.HorizontalDatumID,
		sl.UtmZoneNumber AS UTMZoneID,
		sl.CoordinateSourceUnitID AS GPSUnitID,
		4 AS ProtectedStatusID,
		tx.TaxonomicReferenceAuthorityID,
		i.DateCreated
	FROM MOJN_DS.dbo.Invasives AS i
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON slv.ID = i.SpringLocationVisitID
	LEFT JOIN data.InvasivesActivity as ia ON ia.VisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.SubsiteLocationUTM AS sl ON sl.ID = i.SubsiteLocationUtmID
	LEFT JOIN ref.Taxon AS tx ON tx.ID = i.SpeciesID;
	SET IDENTITY_INSERT data.InvasivesObservation OFF;
END
GO

----------------------------------
--data.InvasivesPhoto
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.InvasivesPhoto)
BEGIN
	SET IDENTITY_INSERT data.InvasivesPhoto ON;
	INSERT INTO data.InvasivesPhoto (
		ID,
		InvasivesObservationID,
		PhotoFileNumber,
		DateCreated
	)
	SELECT
		ID,
		InvasivesID,
		PhotoFileNumber,
		DateCreated
	FROM MOJN_DS.dbo.InvasivesPhoto;
	SET IDENTITY_INSERT data.InvasivesPhoto OFF;
END
GO

----------------------------------
--data.RepeatPhotoActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.RepeatPhotoActivity)
BEGIN
	SET IDENTITY_INSERT data.RepeatPhotoActivity ON;
	INSERT INTO data.RepeatPhotoActivity (
		ID,
		VisitID,
		CameraID,
		CameraCardID,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		r.ID,
		r.SpringLocationVisitID,
		r.CameraID,
		r.CameraCardID,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		r.DateCreated
	FROM MOJN_DS.dbo.RepeatPhotoEvent r
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON slv.ID = r.SpringLocationVisitID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.RepeatPhotoActivity OFF;
END
GO

----------------------------------
--data.RepeatPhotoObservation
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.RepeatPhotoObservation)
BEGIN
	SET IDENTITY_INSERT data.RepeatPhotoObservation ON;
	INSERT INTO data.RepeatPhotoObservation (
		ID,
		RepeatPhotoActivityID,
		RepeatPhotoTypeID,
		UtmX_m,
		UtmY_m,
		HorizontalDatumID,
		UTMZone,
		GPSUnitID,
		Notes,
		DateCreated
	)
	SELECT
		rp.ID,
		rp.RepeatPhotoEventID,
		rp.RepeatPhotoTypeID,
		sl.UtmX_m,
		sl.UtmY_m,
		sl.HorizontalDatumID,
		sl.UtmZoneNumber,
		sl.CoordinateSourceUnitID,
		rp.Notes,
		rp.DateCreated
	FROM MOJN_DS.dbo.RepeatPhotoObservation AS rp
	LEFT JOIN MOJN_DS.dbo.SubsiteLocationUTM AS sl ON sl.ID = rp.SubsiteLocationUtmID;
	SET IDENTITY_INSERT data.RepeatPhotoObservation OFF;
END
GO

----------------------------------
--data.RepeatPhoto
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.RepeatPhoto)
BEGIN
	SET IDENTITY_INSERT data.RepeatPhoto ON;
	INSERT INTO data.RepeatPhoto (
		ID,
		RepeatPhotoObservationID,
		PhotoFileNumber,
		DateCreated
	)
	SELECT
		ID,
		RepeatPhotoObservationID,
		PhotoFileNumber,
		DateCreated
	FROM MOJN_DS.dbo.RepeatPhoto;
	SET IDENTITY_INSERT data.RepeatPhoto OFF;
END
GO

----------------------------------
--data.PhotoActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.PhotoActivity)
BEGIN
	INSERT INTO data.PhotoActivity (
		VisitID,
		CameraID,
		CameraCardID,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote
	)
	SELECT
		v.ID AS VisitID,
		rp.CameraID,
		rp.CameraCardID,
		v.DataProcessingLevelID,
		v.DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote
	FROM data.RepeatPhotoActivity rp
	LEFT JOIN data.Visit v ON rp.VisitID = v.ID
END
----------------------------------
--data.RiparianVegetationActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.RiparianVegetationActivity)
BEGIN
	SET IDENTITY_INSERT data.RiparianVegetationActivity ON;
	INSERT INTO data.RiparianVegetationActivity (
		ID,
		VisitID,
		IsVegetationObservedID,
		MistletoePresentID,
		Notes,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		rv.ID,
		rv.SpringLocationVisitID,
		rv.VegetationPresent,
		rv.MistletoePresent,
		rv.Comments,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		rv.DateCreated
	FROM MOJN_DS.dbo.RiparianVegetationEvent AS rv
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON slv.ID = rv.SpringLocationVisitID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.RiparianVegetationActivity OFF;
END
GO

----------------------------------
--data.RiparianVegetationObservation
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.RiparianVegetationObservation)
BEGIN
	SET IDENTITY_INSERT data.RiparianVegetationObservation ON;
	INSERT INTO data.RiparianVegetationObservation (
		ID,
		RiparianVegetationActivityID,
		LifeFormID,
		Rank,
		DominantSpecies,
		TaxonID,
		ProtectedStatusID,
		TaxonomicReferenceAuthorityID,
		DateCreated
	)
	SELECT
		rvo.ID,
		rvo.RiparianVegetationEventID,
		rvo.LifeFormID,
		rvo.Rank,
		rvo.DominantSpecies,
		rvo.ConfirmedPlantCodeID,
		4 AS ProtectedStatusID,
		tx.TaxonomicReferenceAuthorityID,
		rvo.DateCreated
	FROM MOJN_DS.dbo.RiparianVegetationObservation AS rvo
	LEFT JOIN ref.Taxon AS tx ON tx.ID = rvo.ConfirmedPlantCodeID;
	SET IDENTITY_INSERT data.RiparianVegetationObservation OFF;
END
GO

----------------------------------
--data.RiparianVegetationPhoto
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.RiparianVegetationPhoto)
BEGIN
	SET IDENTITY_INSERT data.RiparianVegetationPhoto ON;
	INSERT INTO data.RiparianVegetationPhoto (
		ID,
		RiparianVegetationObservationID,
		PhotoFileNumber,
		DateCreated
	)
	SELECT
		ID,
		RiparianVegetationObservationID,
		PhotoFileNumber,
		DateCreated
	FROM MOJN_DS.dbo.RiparianVegetationPhoto;
	SET IDENTITY_INSERT data.RiparianVegetationPhoto OFF;
END
GO

----------------------------------
--data.SensorDeployment
----------------------------------
ALTER TABLE data.SensorRetrievalAttempt NOCHECK CONSTRAINT ALL

IF NOT EXISTS (SELECT TOP 1 1 FROM data.SensorDeployment)
BEGIN
	SET IDENTITY_INSERT data.SensorDeployment ON;
	INSERT INTO data.SensorDeployment (
		ID,
		VisitID,
		SensorID,
		DeploymentTimeOfDay,
		Notes,
		DateCreated
	)
	SELECT
		ID,
		SpringLocationVisitID,
		SensorID,
		DeploymentTimeOfDay,
		Notes,
		DateCreated
	FROM MOJN_DS.dbo.SensorDeployment;
	SET IDENTITY_INSERT data.SensorDeployment OFF;
END
GO

----------------------------------
--data.SensorRetrievalAttempt
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.SensorRetrievalAttempt)
BEGIN
	SET IDENTITY_INSERT data.SensorRetrievalAttempt ON;
	INSERT INTO data.SensorRetrievalAttempt (
		ID,
		VisitID,
		SensorDeploymentID,
		IsSensorRetrievedID,
		SensorProblemID,
		RetrievalTimeOfDay,
		IsDownloadSuccessfulID,
		Notes,
		DateCreated
	)
	SELECT
		ID,
		SpringLocationVisitID,
		SensorDeploymentID,
		IsSensorRetrieved,
		SensorProblemID,
		RetrievalTimeOfDay,
		IsDownloadSuccessfulID,
		Notes,
		DateCreated
	FROM MOJN_DS.dbo.SensorRetrievalAttempt;
	SET IDENTITY_INSERT data.SensorRetrievalAttempt OFF;
END
GO
ALTER TABLE data.SensorRetrievalAttempt WITH CHECK CHECK CONSTRAINT ALL
----------------------------------
--data.SpringbrookDimensions
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.SpringbrookDimensions)
BEGIN
	SET IDENTITY_INSERT data.SpringbrookDimensions ON;
	INSERT INTO data.SpringbrookDimensions (
		ID,
		DischargeActivityID,
		SpringbrookLength_meters,
		SpringbrookWidth_m,
		SpringbrookLengthFlagID,
		Notes,
		DateCreated
	)
	SELECT
		sd.ID,
		da.ID AS DischargeActivityID,
		sd.SpringbrookLength_meters,
		sd.SpringbrookWidth_m,
		sd.SpringbrookLengthFlagID,
		sd.Notes,
		sd.DateCreated
	FROM MOJN_DS.dbo.SpringbrookDimensions AS sd
	LEFT JOIN data.DischargeActivity AS da ON da.VisitID = sd.SpringLocationVisitID;
	SET IDENTITY_INSERT data.SpringbrookDimensions OFF;
END
GO

----------------------------------
--data.VisitPersonnel
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.VisitPersonnel)
BEGIN
	INSERT INTO data.VisitPersonnel (
		VisitID,
		PersonnelID,
		PersonnelRoleID,
		DateCreated
	)
	SELECT
		SpringLocationVisitID,
		MOJNPersonnelID,
		DataPersonnelRoleID,
		DateCreated
	FROM MOJN_DS.dbo.SpringLocationVisitDataPersonnel
	UNION
	SELECT
		SpringLocationVisitID,
		MOJNPersonnelID,
		5 AS PersonnelRoleID,
		DateCreated
	FROM MOJN_DS.dbo.SpringLocationVisitMOJNPersonnel;
END
GO

----------------------------------
--data.WaterQualityActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.WaterQualityActivity)
BEGIN
	SET IDENTITY_INSERT data.WaterQualityActivity ON;
	INSERT INTO data.WaterQualityActivity (
		ID,
		VisitID,
		WaterQualityDataCollectedID,
		pHInstrumentID,
		DOInstrumentID,
		SpCondInstrumentID,
		TemperatureInstrumentID,
		Notes,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		wq.ID,
		slv.ID AS SpringLocationVisitID,
		dc.WaterQualityDataCollectedID,
		wq.pHInstrumentID AS pHInstrumentID,
		wq.InstrumentID AS DOInstrumentID,
		wq.InstrumentID AS SpCondInstrumentID,
		wq.InstrumentID AS TemperatureInstrumentID,
		slv.WaterQualityComments as Notes,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		slv.DateCreated
	FROM MOJN_DS.dbo.WaterQualityEvent AS wq
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit AS slv ON wq.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit_AcceptanceRejection AS ar ON ar.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.lookup.AcceptanceRejectionReason arr
	ON ar.AcceptanceRejectionReasonID = arr.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.DataCollected AS dc ON dc.SpringLocationVisitID = slv.ID;
	SET IDENTITY_INSERT data.WaterQualityActivity OFF;

	INSERT INTO data.WaterQualityActivity (
		VisitID,
		WaterQualityDataCollectedID,
		pHInstrumentID,
		DOInstrumentID,
		SpCondInstrumentID,
		TemperatureInstrumentID,
		Notes,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		slv.ID AS SpringLocationVisitID,
		dc.WaterQualityDataCollectedID,
		29 AS pHInstrumentID,
		29 AS DOInstrumentID,
		29 AS SpCondInstrumentID,
		29 AS TemperatureInstrumentID,
		slv.WaterQualityComments as Notes,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		slv.DateCreated
	FROM MOJN_DS.dbo.SpringLocationVisit AS slv
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit_AcceptanceRejection AS ar ON ar.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.lookup.AcceptanceRejectionReason arr
	ON ar.AcceptanceRejectionReasonID = arr.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.DataCollected AS dc ON dc.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.WaterQualityEvent AS wq ON wq.SpringLocationVisitID = slv.ID
	WHERE arr.AcceptanceCategory = 'Accepted' AND wq.ID IS NULL;
END
GO

----------------------------------
--data.WaterQualityDO
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.WaterQualityDO)
BEGIN
	SET IDENTITY_INSERT data.WaterQualityDO ON;
	INSERT INTO data.WaterQualityDO (
		ID,
		WaterQualityActivityID,
		DissolvedOxygen_percent,
		DissolvedOxygen_mg_per_L,
		DataQualityFlagID,
		DataQualityFlagNote,
		DateCreated
	)
	SELECT
		ID,
		WaterQualityEventID,
		DissolvedOxygen_percent,
		DissolvedOxygen_mg_per_Liter,
		1 AS DataQualityFlagID,
		NULL AS DataQualityFlagNote,
		DateCreated
	FROM MOJN_DS.dbo.InstrumentWaterQualityMeasurement
	WHERE DissolvedOxygen_percent IS NOT NULL OR DissolvedOxygen_mg_per_Liter IS NOT NULL;
	SET IDENTITY_INSERT data.WaterQualityDO OFF;
END
GO

----------------------------------
--data.WaterQualitypH
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.WaterQualitypH)
BEGIN
	SET IDENTITY_INSERT data.WaterQualitypH ON;
	INSERT INTO data.WaterQualitypH (
		ID,
		WaterQualityActivityID,
		pH,
		DataQualityFlagID,
		DataQualityFlagNote,
		DateCreated
	)
	SELECT
		ID,
		WaterQualityEventID,
		pH,
		1 AS DataQualityFlagID,
		NULL AS DataQualityFlagNote,
		DateCreated
	FROM MOJN_DS.dbo.InstrumentWaterQualityMeasurement
	WHERE pH IS NOT NULL;
	SET IDENTITY_INSERT data.WaterQualitypH OFF;
END
GO

----------------------------------
--data.WaterQualitySpCond
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.WaterQualitySpCond)
BEGIN
	SET IDENTITY_INSERT data.WaterQualitySpCond ON;
	INSERT INTO data.WaterQualitySpCond (
		ID,
		WaterQualityActivityID,
		SpecificConductance_microS_per_cm,
		DataQualityFlagID,
		DataQualityFlagNote,
		DateCreated
	)
	SELECT
		ID,
		WaterQualityEventID,
		SpecificConductivity_microsiemens_per_cm,
		1 AS DataQualityFlagID,
		NULL AS DataQualityFlagNote,
		DateCreated
	FROM MOJN_DS.dbo.InstrumentWaterQualityMeasurement
	WHERE SpecificConductivity_microsiemens_per_cm IS NOT NULL;
	SET IDENTITY_INSERT data.WaterQualitySpCond OFF;
END
GO

----------------------------------
--data.WaterQualityTemperature
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.WaterQualityTemperature)
BEGIN
	SET IDENTITY_INSERT data.WaterQualityTemperature ON;
	INSERT INTO data.WaterQualityTemperature (
		ID,
		WaterQualityActivityID,
		WaterTemperature_C,
		DataQualityFlagID,
		DataQualityFlagNote,
		DateCreated
	)
	SELECT
		ID,
		WaterQualityEventID,
		WaterTemperature_C,
		1 AS DataQualityFlagID,
		NULL AS DataQualityFlagNote,
		DateCreated
	FROM MOJN_DS.dbo.InstrumentWaterQualityMeasurement
	WHERE WaterTemperature_C IS NOT NULL;
	SET IDENTITY_INSERT data.WaterQualityTemperature OFF;
END
GO

----------------------------------
--data.WildlifeActivity
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.WildlifeActivity)
BEGIN
	INSERT INTO data.WildlifeActivity (
		VisitID,
		IsWildlifeObservedID,
		DataProcessingLevelID,
		DataProcessingLevelDate,
		DataProcessingLevelNote,
		DateCreated
	)
	SELECT
		slv.ID,
		IIF(MAX(wl.ID) IS NULL, 2, 1) AS IsWildlifeObservedID,
		IIF(dr.PassedReview = 1, 2, 1) AS DataProcessingLevelID,
		GETDATE() DataProcessingLevelDate,
		NULL AS DataProcessingLevelNote,
		slv.DateCreated
	FROM MOJN_DS.dbo.SpringLocationVisit as slv
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisit_AcceptanceRejection AS ar ON ar.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.lookup.AcceptanceRejectionReason AS arr
	ON ar.AcceptanceRejectionReasonID = arr.ID
	LEFT JOIN MOJN_DS.dbo.SpringLocationVisitDataReview AS dr ON dr.SpringLocationVisitID = slv.ID
	LEFT JOIN MOJN_DS.dbo.Wildlife AS wl ON wl.SpringLocationVisitID = slv.ID
	WHERE arr.AcceptanceCategory = 'Accepted'
	GROUP BY slv.ID, dr.PassedReview, slv.DateCreated;
END
GO

----------------------------------
--data.WildlifeObservation
----------------------------------
IF NOT EXISTS (SELECT TOP 1 1 FROM data.WildlifeObservation)
BEGIN
	SET IDENTITY_INSERT data.WildlifeObservation ON;
	INSERT INTO data.WildlifeObservation (
		ID,
		WildlifeActivityID,
		WildlifeTypeID,
		SpeciesName,
		WildlifeEvidenceID,
		EvidenceNotes,
		DateCreated
	)
	SELECT
		wl.ID,
		wa.ID AS WildlifeActivityID,
		wl.WildlifeTypeID,
		wl.SpeciesName,
		wl.WildlifeEvidenceID,
		wl.EvidenceNotes,
		wl.DateCreated
	FROM MOJN_DS.dbo.Wildlife wl
	INNER JOIN data.WildlifeActivity wa ON wa.VisitID = wl.SpringLocationVisitID;
	SET IDENTITY_INSERT data.WildlifeObservation OFF;
END
GO

USE MOJN_DS_Dev;
GO
