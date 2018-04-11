USE [MOJN_DS_Dev]
GO

/****** Object:  View [app].[ActivityDashboard]    Script Date: 4/11/2018 3:00:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [app].[ActivityDashboard]
AS
SELECT        'Discharge' AS Activity, lookup.FlowCondition.Label AS Status, lookup.DataProcessingLevel.Label AS DPL, data.DischargeActivity.DataProcessingLevelDate AS Date, data.DischargeActivity.VisitID
FROM            data.DischargeActivity INNER JOIN
                         lookup.FlowCondition ON data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID INNER JOIN
                         lookup.DataProcessingLevel ON data.DischargeActivity.DataProcessingLevelID = lookup.DataProcessingLevel.ID
UNION
SELECT        'Wildlife' AS Activity, lookup.IsWildlifeObserved.Label AS Status, lookup.DataProcessingLevel.Label AS DPL, data.WildlifeActivity.DataProcessingLevelDate AS Date, data.WildlifeActivity.VisitID
FROM            lookup.DataProcessingLevel INNER JOIN
                         data.WildlifeActivity ON lookup.DataProcessingLevel.ID = data.WildlifeActivity.DataProcessingLevelID INNER JOIN
                         lookup.IsWildlifeObserved ON data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID
UNION
SELECT        'Riparian' AS Activity, lookup.IsVegetationObserved.Label AS Status, lookup.DataProcessingLevel.Label AS DPL, data.RiparianVegetationActivity.DataProcessingLevelDate AS Date, 
                         data.RiparianVegetationActivity.VisitID
FROM            lookup.DataProcessingLevel INNER JOIN
                         data.RiparianVegetationActivity ON lookup.DataProcessingLevel.ID = data.RiparianVegetationActivity.DataProcessingLevelID INNER JOIN
                         lookup.IsVegetationObserved ON data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID
UNION
SELECT        'Invasives' AS Activity, lookup.InvasivesObserved.Label AS Status, lookup.DataProcessingLevel.Label AS DPL, data.InvasivesActivity.DataProcessingLevelDate AS Date, data.InvasivesActivity.VisitID
FROM            lookup.DataProcessingLevel INNER JOIN
                         data.InvasivesActivity ON lookup.DataProcessingLevel.ID = data.InvasivesActivity.DataProcessingLevelID AND lookup.DataProcessingLevel.ID = data.InvasivesActivity.DataProcessingLevelID INNER JOIN
                         lookup.InvasivesObserved ON data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID
UNION
SELECT        'Disturbance' AS Activity, 'Yes' AS Status, lookup.DataProcessingLevel.Label AS DPL, data.DisturbanceActivity.DataProcessingLevelDate AS Date, data.DisturbanceActivity.VisitID
FROM            lookup.DataProcessingLevel INNER JOIN
                         data.DisturbanceActivity ON lookup.DataProcessingLevel.ID = data.DisturbanceActivity.DataProcessingLevelID AND lookup.DataProcessingLevel.ID = data.DisturbanceActivity.DataProcessingLevelID
UNION
SELECT        'Quality' AS Activity, lookup.WaterQualityDataCollected.Label AS Status, lookup.DataProcessingLevel.Label AS DPL, data.WaterQualityActivity.DataProcessingLevelDate AS Date, 
                         data.WaterQualityActivity.VisitID
FROM            lookup.DataProcessingLevel INNER JOIN
                         data.WaterQualityActivity ON lookup.DataProcessingLevel.ID = data.WaterQualityActivity.DataProcessingLevelID AND lookup.DataProcessingLevel.ID = data.WaterQualityActivity.DataProcessingLevelID AND 
                         lookup.DataProcessingLevel.ID = data.WaterQualityActivity.DataProcessingLevelID INNER JOIN
                         lookup.WaterQualityDataCollected ON data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID       

GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'app', @level1type=N'VIEW',@level1name=N'ActivityDashboard'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'app', @level1type=N'VIEW',@level1name=N'ActivityDashboard'
GO

