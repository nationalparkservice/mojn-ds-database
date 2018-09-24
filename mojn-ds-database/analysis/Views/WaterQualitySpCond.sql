﻿CREATE VIEW analysis.WaterQualitySpCond
AS
SELECT        intermediate.WaterQuality.ParkCode, intermediate.WaterQuality.SiteCode, intermediate.WaterQuality.SiteName, intermediate.WaterQuality.VisitDate, intermediate.WaterQuality.VisitGroup, 
                         intermediate.WaterQuality.WaterQualityDataCollected AS WQDataCollected, WaterQualitySpCond_1.SpecificConductance_microS_per_cm, lookup.DataQualityFlag.Code AS DataQualityFlag, 
                         WaterQualitySpCond_1.DataQualityFlagNote, intermediate.WaterQuality.SpCondInstrument, intermediate.WaterQuality.VisitType, intermediate.WaterQuality.DPL, 
                         intermediate.WaterQuality.MonitoringStatus
FROM            lookup.DataQualityFlag RIGHT OUTER JOIN
                         data.WaterQualitySpCond AS WaterQualitySpCond_1 ON lookup.DataQualityFlag.ID = WaterQualitySpCond_1.DataQualityFlagID RIGHT OUTER JOIN
                         intermediate.WaterQuality ON WaterQualitySpCond_1.WaterQualityActivityID = intermediate.WaterQuality.WaterQualityActivityID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualitySpCond';




GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[30] 4[53] 2[9] 3) )"
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
         Left = -384
      End
      Begin Tables = 
         Begin Table = "DataQualityFlag (lookup)"
            Begin Extent = 
               Top = 61
               Left = 44
               Bottom = 191
               Right = 214
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "WaterQualitySpCond_1"
            Begin Extent = 
               Top = 40
               Left = 452
               Bottom = 245
               Right = 739
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQuality (intermediate)"
            Begin Extent = 
               Top = 14
               Left = 816
               Bottom = 288
               Right = 1048
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
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
         Column = 3195
         Alias = 1485
         Table = 2520
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualitySpCond';





