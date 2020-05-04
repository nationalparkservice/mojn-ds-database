CREATE VIEW analysis.WaterQualityDO
AS
SELECT        intermediate.WaterQuality.Park, intermediate.WaterQuality.SiteCode, intermediate.WaterQuality.SiteName, intermediate.WaterQuality.VisitDate, intermediate.WaterQuality.FieldSeason, 
                         intermediate.WaterQuality.WaterQualityDataCollected AS WQDataCollected, WaterQualityDO_1.DissolvedOxygen_percent, WaterQualityDO_1.DissolvedOxygen_mg_per_L, lookup.DataQualityFlag.Code AS DataQualityFlag, 
                         WaterQualityDO_1.DataQualityFlagNote, intermediate.WaterQuality.DOInstrument, intermediate.WaterQuality.VisitType, intermediate.WaterQuality.DPL, intermediate.WaterQuality.MonitoringStatus
FROM            data.WaterQualityDO AS WaterQualityDO_1 LEFT OUTER JOIN
                         lookup.DataQualityFlag ON WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID AND WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID AND 
                         WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID AND WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID AND WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID AND 
                         WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID AND WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID AND 
                         WaterQualityDO_1.DataQualityFlagID = lookup.DataQualityFlag.ID RIGHT OUTER JOIN
                         intermediate.WaterQuality ON WaterQualityDO_1.WaterQualityActivityID = intermediate.WaterQuality.WaterQualityActivityID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualityDO';




GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[49] 2[3] 3) )"
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
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "WaterQualityDO_1"
            Begin Extent = 
               Top = 144
               Left = 355
               Bottom = 383
               Right = 590
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DataQualityFlag (lookup)"
            Begin Extent = 
               Top = 193
               Left = 721
               Bottom = 377
               Right = 891
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "WaterQuality (intermediate)"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 453
               Right = 270
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 2220
         Width = 2385
         Width = 3900
         Width = 1845
         Width = 1500
         Width = 2340
         Width = 1500
         Width = 1500
         Width = 1845
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2730
         Alias = 900
         Table = 1170
         Output = 1425
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualityDO';





