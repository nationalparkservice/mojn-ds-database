CREATE VIEW analysis.WaterQualitypH
AS
SELECT        intermediate.WaterQuality.ParkCode, intermediate.WaterQuality.SiteCode, intermediate.WaterQuality.SiteName, intermediate.WaterQuality.VisitDate, intermediate.WaterQuality.VisitGroup, 
                         lookup.DataQualityFlag.Code AS DataQualityFlag, intermediate.WaterQuality.DPL, intermediate.WaterQuality.pHInstrument, WaterQualitypH_1.pH, WaterQualitypH_1.DataQualityFlagNote, 
                         intermediate.WaterQuality.VisitType
FROM            lookup.DataQualityFlag RIGHT OUTER JOIN
                         data.WaterQualitypH AS WaterQualitypH_1 ON lookup.DataQualityFlag.ID = WaterQualitypH_1.DataQualityFlagID RIGHT OUTER JOIN
                         intermediate.WaterQuality ON WaterQualitypH_1.WaterQualityActivityID = intermediate.WaterQuality.WaterQualityActivityID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualitypH';




GO



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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DataQualityFlag (lookup)"
            Begin Extent = 
               Top = 182
               Left = 910
               Bottom = 312
               Right = 1080
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQualitypH_1"
            Begin Extent = 
               Top = 166
               Left = 485
               Bottom = 354
               Right = 694
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WaterQuality (intermediate)"
            Begin Extent = 
               Top = 114
               Left = 76
               Bottom = 377
               Right = 308
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
      Begin ColumnWidths = 12
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
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 3255
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'WaterQualitypH';



