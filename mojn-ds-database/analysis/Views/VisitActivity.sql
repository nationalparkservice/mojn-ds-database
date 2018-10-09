CREATE VIEW analysis.VisitActivity
AS
SELECT        intermediate.SiteVisit.ParkCode, intermediate.SiteVisit.SiteCode, intermediate.SiteVisit.SiteName, intermediate.SiteVisit.VisitDate, intermediate.SiteVisit.VisitGroup, intermediate.SiteVisit.SpringType, 
                         lookup.FlowCondition.Label AS FlowCondition, lookup.WaterQualityDataCollected.Label AS WQDataCollected, lookup.InvasivesObserved.Label AS InvasivesObserved, 
                         lookup.IsVegetationObserved.Label AS RiparianObserved, lookup.MistletoePresent.Label AS MistletoePresent, lookup.IsWildlifeObserved.Label AS WildlifeObserved, intermediate.SiteVisit.SampleFrame, 
                         intermediate.SiteVisit.VisitType, intermediate.SiteVisit.MonitoringStatus
FROM            lookup.IsWildlifeObserved RIGHT OUTER JOIN
                         lookup.WaterQualityDataCollected RIGHT OUTER JOIN
                         lookup.MistletoePresent RIGHT OUTER JOIN
                         data.WaterQualityActivity RIGHT OUTER JOIN
                         data.WildlifeActivity RIGHT OUTER JOIN
                         intermediate.SiteVisit LEFT OUTER JOIN
                         data.DischargeActivity ON intermediate.SiteVisit.VisitID = data.DischargeActivity.VisitID ON data.WildlifeActivity.VisitID = intermediate.SiteVisit.VisitID ON 
                         data.WaterQualityActivity.VisitID = intermediate.SiteVisit.VisitID LEFT OUTER JOIN
                         data.InvasivesActivity ON intermediate.SiteVisit.VisitID = data.InvasivesActivity.VisitID LEFT OUTER JOIN
                         data.RiparianVegetationActivity ON intermediate.SiteVisit.VisitID = data.RiparianVegetationActivity.VisitID LEFT OUTER JOIN
                         lookup.FlowCondition ON data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID LEFT OUTER JOIN
                         lookup.IsVegetationObserved ON data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID ON 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID LEFT OUTER JOIN
                         lookup.InvasivesObserved ON data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND 
                         data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID ON 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID AND 
                         lookup.WaterQualityDataCollected.ID = data.WaterQualityActivity.WaterQualityDataCollectedID ON lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND 
                         lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND 
                         lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND 
                         lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND 
                         lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND 
                         lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND 
                         lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID
WHERE        (intermediate.SiteVisit.MonitoringStatus = 'Sampled')
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'VisitActivity';




GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'     Top = 441
               Left = 361
               Bottom = 571
               Right = 584
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesActivity (data)"
            Begin Extent = 
               Top = 182
               Left = 741
               Bottom = 312
               Right = 964
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RiparianVegetationActivity (data)"
            Begin Extent = 
               Top = 0
               Left = 660
               Bottom = 160
               Right = 883
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FlowCondition (lookup)"
            Begin Extent = 
               Top = 708
               Left = 951
               Bottom = 821
               Right = 1121
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IsVegetationObserved (lookup)"
            Begin Extent = 
               Top = 17
               Left = 1112
               Bottom = 130
               Right = 1341
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesObserved (lookup)"
            Begin Extent = 
               Top = 211
               Left = 1027
               Bottom = 324
               Right = 1255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2175
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 870
         Width = 2640
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1815
         Table = 2280
         Output = 1260
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'VisitActivity';






GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[56] 4[19] 2[10] 3) )"
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "IsWildlifeObserved (lookup)"
            Begin Extent = 
               Top = 542
               Left = 1014
               Bottom = 655
               Right = 1184
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQualityDataCollected (lookup)"
            Begin Extent = 
               Top = 358
               Left = 1034
               Bottom = 471
               Right = 1204
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MistletoePresent (lookup)"
            Begin Extent = 
               Top = 144
               Left = 1308
               Bottom = 257
               Right = 1478
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQualityActivity (data)"
            Begin Extent = 
               Top = 324
               Left = 701
               Bottom = 454
               Right = 944
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "WildlifeActivity (data)"
            Begin Extent = 
               Top = 469
               Left = 704
               Bottom = 599
               Right = 927
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "SiteVisit (intermediate)"
            Begin Extent = 
               Top = 9
               Left = 165
               Bottom = 322
               Right = 346
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DischargeActivity (data)"
            Begin Extent = 
          ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'VisitActivity';





