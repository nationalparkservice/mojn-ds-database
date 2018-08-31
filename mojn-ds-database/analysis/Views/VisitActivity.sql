CREATE VIEW analysis.[VisitActivity]
AS
SELECT        P.Code AS ParkCode, lookup.Subunit.Label AS Subunit, S.Code AS SiteCode, S.Name AS SiteName, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, lookup.SpringType.Label AS SpringType, 
                         lookup.FlowCondition.Label AS FlowCondition, lookup.WaterQualityDataCollected.Code AS WQDataCollected, lookup.InvasivesObserved.Code AS InvasivesObserved, 
                         lookup.IsVegetationObserved.Code AS RiparianObserved, lookup.MistletoePresent.Code AS MistletoePresent, lookup.IsWildlifeObserved.Code AS WildlifeObserved, lookup.GRTSPanel.Code AS SampleFrame, 
                         lookup.VisitType.Label AS VisitType, DPL.Label AS DPL
FROM            data.WaterQualityActivity INNER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND data.WaterQualityActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WaterQualityActivity.DataProcessingLevelID = DPL.ID INNER JOIN
                         lookup.WaterQualityDataCollected ON data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND 
                         data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID AND data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID INNER JOIN
                         data.WildlifeActivity ON DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND 
                         DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND 
                         DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND 
                         DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND DPL.ID = data.WildlifeActivity.DataProcessingLevelID AND 
                         DPL.ID = data.WildlifeActivity.DataProcessingLevelID INNER JOIN
                         lookup.IsWildlifeObserved ON data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND 
                         data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND 
                         data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND 
                         data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND 
                         data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND 
                         data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID AND 
                         data.WildlifeActivity.IsWildlifeObservedID = lookup.IsWildlifeObserved.ID INNER JOIN
                         data.DischargeActivity ON DPL.ID = data.DischargeActivity.DataProcessingLevelID AND DPL.ID = data.DischargeActivity.DataProcessingLevelID AND DPL.ID = data.DischargeActivity.DataProcessingLevelID AND 
                         DPL.ID = data.DischargeActivity.DataProcessingLevelID AND DPL.ID = data.DischargeActivity.DataProcessingLevelID AND DPL.ID = data.DischargeActivity.DataProcessingLevelID AND 
                         DPL.ID = data.DischargeActivity.DataProcessingLevelID AND DPL.ID = data.DischargeActivity.DataProcessingLevelID AND DPL.ID = data.DischargeActivity.DataProcessingLevelID AND 
                         DPL.ID = data.DischargeActivity.DataProcessingLevelID INNER JOIN
                         lookup.FlowCondition ON data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID RIGHT OUTER JOIN
                         data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.GRTSPanel ON S.GRTSPanelID = lookup.GRTSPanel.ID INNER JOIN
                         lookup.GRTSStatus ON S.GRTSStatusID = lookup.GRTSStatus.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID INNER JOIN
                         lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND 
                         V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID INNER JOIN
                         lookup.MonitoringStatus ON V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND 
                         V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID ON data.DischargeActivity.VisitID = V.ID AND 
                         data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND 
                         data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND data.DischargeActivity.VisitID = V.ID AND 
                         data.DischargeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND 
                         data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND 
                         data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WildlifeActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND 
                         data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND 
                         data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND 
                         data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND 
                         data.WaterQualityActivity.VisitID = V.ID AND data.WaterQualityActivity.VisitID = V.ID AND DPL.ID = V.DataProcessingLevelID LEFT OUTER JOIN
                         lookup.SpringType ON V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID AND 
                         V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID FULL OUTER JOIN
                         data.RiparianVegetationActivity INNER JOIN
                         lookup.IsVegetationObserved ON data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND 
                         data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID AND data.RiparianVegetationActivity.IsVegetationObservedID = lookup.IsVegetationObserved.ID INNER JOIN
                         lookup.MistletoePresent ON data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND 
                         data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND 
                         data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND 
                         data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND 
                         data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND 
                         data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND 
                         data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID AND 
                         data.RiparianVegetationActivity.MistletoePresentID = lookup.MistletoePresent.ID ON DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND 
                         DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND 
                         DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND 
                         DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND 
                         DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND 
                         DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND DPL.ID = data.RiparianVegetationActivity.DataProcessingLevelID AND V.ID = data.RiparianVegetationActivity.VisitID AND 
                         V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND 
                         V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND 
                         V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND 
                         V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID FULL OUTER JOIN
                         lookup.InvasivesObserved INNER JOIN
                         data.InvasivesActivity ON lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND 
                         lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND 
                         lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND 
                         lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND 
                         lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND 
                         lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND 
                         lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND 
                         lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID AND lookup.InvasivesObserved.ID = data.InvasivesActivity.InvasivesObservedID ON 
                         DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND 
                         DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND 
                         DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND 
                         DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND 
                         DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND 
                         DPL.ID = data.InvasivesActivity.DataProcessingLevelID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND 
                         V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND 
                         V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND 
                         V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID
WHERE        (lookup.MonitoringStatus.Label = 'Sampled')
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 3, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'VisitActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane3', @value = N'ity (data)"
            Begin Extent = 
               Top = 809
               Left = 505
               Bottom = 939
               Right = 728
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FlowCondition (lookup)"
            Begin Extent = 
               Top = 762
               Left = 281
               Bottom = 875
               Right = 451
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
         Width = 1500
         Width = 1500
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
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MonitoringStatus (lookup)"
            Begin Extent = 
               Top = 151
               Left = 459
               Bottom = 281
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SpringType (lookup)"
            Begin Extent = 
               Top = 140
               Left = 672
               Bottom = 270
               Right = 842
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 285
               Left = 249
               Bottom = 415
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesActivity (data)"
            Begin Extent = 
               Top = 258
               Left = 678
               Bottom = 388
               Right = 901
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesObserved (lookup)"
            Begin Extent = 
               Top = 503
               Left = 671
               Bottom = 616
               Right = 899
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IsVegetationObserved (lookup)"
            Begin Extent = 
               Top = 465
               Left = 342
               Bottom = 578
               Right = 571
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RiparianVegetationActivity (data)"
            Begin Extent = 
               Top = 477
               Left = 49
               Bottom = 607
               Right = 272
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MistletoePresent (lookup)"
            Begin Extent = 
               Top = 519
               Left = 381
               Bottom = 632
               Right = 551
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQualityActivity (data)"
            Begin Extent = 
               Top = 638
               Left = 0
               Bottom = 768
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQualityDataCollected (lookup)"
            Begin Extent = 
               Top = 647
               Left = 349
               Bottom = 760
               Right = 519
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IsWildlifeObserved (lookup)"
            Begin Extent = 
               Top = 671
               Left = 566
               Bottom = 784
               Right = 736
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WildlifeActivity (data)"
            Begin Extent = 
               Top = 618
               Left = 797
               Bottom = 748
               Right = 1020
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DischargeActiv', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'VisitActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
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
         Top = -384
         Left = 0
      End
      Begin Tables = 
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 546
               Bottom = 136
               Right = 716
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSPanel (lookup)"
            Begin Extent = 
               Top = 6
               Left = 754
               Bottom = 119
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSStatus (lookup)"
            Begin Extent = 
               Top = 120
               Left = 754
               Bottom = 250
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'VisitActivity';

