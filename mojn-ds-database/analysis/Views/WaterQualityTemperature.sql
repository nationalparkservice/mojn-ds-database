CREATE VIEW analysis.WaterQualityTemperature
AS
SELECT        intermediate.WaterQuality.ParkCode, intermediate.WaterQuality.SiteCode, intermediate.WaterQuality.SiteName, intermediate.WaterQuality.VisitDate, intermediate.WaterQuality.VisitGroup, 
                         intermediate.WaterQuality.WaterQualityDataCollected AS WQDataCollected, WaterQualityTemperature_1.WaterTemperature_C, lookup.DataQualityFlag.Code AS DataQualityFlag, 
                         WaterQualityTemperature_1.DataQualityFlagNote, intermediate.WaterQuality.TempInstrument, intermediate.WaterQuality.VisitType, intermediate.WaterQuality.DPL, 
                         intermediate.WaterQuality.MonitoringStatus
FROM            lookup.DataQualityFlag RIGHT OUTER JOIN
                         data.WaterQualityTemperature AS WaterQualityTemperature_1 ON lookup.DataQualityFlag.ID = WaterQualityTemperature_1.DataQualityFlagID RIGHT OUTER JOIN
                         intermediate.WaterQuality ON WaterQualityTemperature_1.WaterQualityActivityID = intermediate.WaterQuality.WaterQualityActivityID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualityTemperature';




GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[44] 2[5] 3) )"
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
         Left = -192
      End
      Begin Tables = 
         Begin Table = "DataQualityFlag (lookup)"
            Begin Extent = 
               Top = 85
               Left = 55
               Bottom = 215
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQualityTemperature_1"
            Begin Extent = 
               Top = 30
               Left = 319
               Bottom = 241
               Right = 528
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQuality (intermediate)"
            Begin Extent = 
               Top = 19
               Left = 604
               Bottom = 252
               Right = 838
            End
            DisplayFlags = 280
            TopColumn = 4
         End
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
         Column = 1890
         Alias = 1485
         Table = 3045
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualityTemperature';





