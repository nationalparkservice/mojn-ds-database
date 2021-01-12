﻿CREATE VIEW intermediate.WaterQuality
AS
SELECT        DPL.Label AS DPL, intermediate.SiteVisit.Park, intermediate.SiteVisit.SiteCode, intermediate.SiteVisit.SiteName, intermediate.SiteVisit.VisitDate, intermediate.SiteVisit.FieldSeason, intermediate.SiteVisit.VisitType, 
                         SpCondInstrument.Label AS SpCondInstrument, TempInstrument.Label AS TempInstrument, DOInstrument.Label AS DOInstrument, pHInstrument.Label AS pHInstrument, 
                         lookup.WaterQualityDataCollected.Label AS WaterQualityDataCollected, intermediate.SiteVisit.MonitoringStatus, data.WaterQualityActivity.ID AS WaterQualityActivityID, data.WaterQualityActivity.WaterQualityDataCollectedID, 
                         pHDataQualityFlag.Code AS pHDataQualityFlag, DODataQualityFlag.Code AS DODataQualityFlag, SpCondDataQualityFlag.Code AS SpCondDataQualityFlag, TemperatureDataQualityFlag.Code AS TempDataQualityFlag, 
                         data.WaterQualityActivity.Notes AS WaterQualityNotes
FROM            lookup.DataQualityFlag AS pHDataQualityFlag INNER JOIN
                         data.WaterQualityActivity ON pHDataQualityFlag.ID = data.WaterQualityActivity.pHDataQualityFlagID INNER JOIN
                         lookup.DataQualityFlag AS DODataQualityFlag ON data.WaterQualityActivity.DissolvedOxygenDataQualityFlagID = DODataQualityFlag.ID INNER JOIN
                         lookup.DataQualityFlag AS SpCondDataQualityFlag ON data.WaterQualityActivity.SpecificConductanceDataQualityFlagID = SpCondDataQualityFlag.ID INNER JOIN
                         lookup.DataQualityFlag AS TemperatureDataQualityFlag ON data.WaterQualityActivity.WaterTemperatureDataQualityFlagID = TemperatureDataQualityFlag.ID LEFT OUTER JOIN
                         lookup.WaterQualityDataCollected ON data.WaterQualityActivity.WaterQualityDataCollectedID = lookup.WaterQualityDataCollected.ID RIGHT OUTER JOIN
                         intermediate.SiteVisit ON data.WaterQualityActivity.VisitID = intermediate.SiteVisit.VisitID LEFT OUTER JOIN
                         ref.WaterQualityInstrument_Shared AS TempInstrument ON data.WaterQualityActivity.TemperatureInstrumentID = TempInstrument.ID LEFT OUTER JOIN
                         ref.WaterQualityInstrument_Shared AS DOInstrument ON data.WaterQualityActivity.DOInstrumentID = DOInstrument.ID LEFT OUTER JOIN
                         ref.WaterQualityInstrument_Shared AS pHInstrument ON data.WaterQualityActivity.pHInstrumentID = pHInstrument.ID LEFT OUTER JOIN
                         ref.WaterQualityInstrument_Shared AS SpCondInstrument ON data.WaterQualityActivity.SpCondInstrumentID = SpCondInstrument.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.WaterQualityActivity.DataProcessingLevelID = DPL.ID
WHERE        (intermediate.SiteVisit.MonitoringStatus = 'Sampled')
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'WaterQuality';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Bottom = 136
               Right = 1405
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 320
               Left = 720
               Bottom = 450
               Right = 890
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pHDataQualityFlag"
            Begin Extent = 
               Top = 40
               Left = 697
               Bottom = 170
               Right = 867
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DODataQualityFlag"
            Begin Extent = 
               Top = 78
               Left = 728
               Bottom = 208
               Right = 898
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SpCondDataQualityFlag"
            Begin Extent = 
               Top = 110
               Left = 761
               Bottom = 240
               Right = 931
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TemperatureDataQualityFlag"
            Begin Extent = 
               Top = 161
               Left = 772
               Bottom = 291
               Right = 942
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
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2220
         Width = 2385
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
         Alias = 2370
         Table = 3090
         Output = 795
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
', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'WaterQuality';








GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[39] 4[40] 2[12] 3) )"
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
         Begin Table = "WaterQualityDataCollected (lookup)"
            Begin Extent = 
               Top = 147
               Left = 988
               Bottom = 260
               Right = 1158
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQualityActivity (data)"
            Begin Extent = 
               Top = 38
               Left = 306
               Bottom = 314
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "SiteVisit (intermediate)"
            Begin Extent = 
               Top = 27
               Left = 54
               Bottom = 312
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TempInstrument"
            Begin Extent = 
               Top = 6
               Left = 587
               Bottom = 136
               Right = 763
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DOInstrument"
            Begin Extent = 
               Top = 6
               Left = 801
               Bottom = 136
               Right = 977
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pHInstrument"
            Begin Extent = 
               Top = 6
               Left = 1015
               Bottom = 136
               Right = 1191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SpCondInstrument"
            Begin Extent = 
               Top = 6
               Left = 1229
               ', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'WaterQuality';









