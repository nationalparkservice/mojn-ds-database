CREATE VIEW analysis.Site
AS
SELECT        Park.Code AS ParkCode, lookup.Subunit.Label AS Subunit, Site_1.Code AS SiteCode, Site_1.Name AS SiteName, lookup.GRTSDraw.Label AS GRTSDraw, Site_1.GRTSOrder, lookup.GRTSStatus.Code AS SiteStatus, 
                         lookup.GRTSPanel.Code AS SampleFrame, lookup.ProtectedStatus.Label AS SiteProtectedStatus, Site_1.Lat_WGS84, Site_1.Lon_WGS84, Site_1.X_UTM_NAD83_11N, Site_1.Y_UTM_NAD83_11N
FROM            data.Site AS Site_1 INNER JOIN
                         lookup.Park AS Park ON Site_1.ParkID = Park.ID LEFT OUTER JOIN
                         lookup.GRTSPanel ON Site_1.GRTSPanelID = lookup.GRTSPanel.ID LEFT OUTER JOIN
                         lookup.GRTSStatus ON Site_1.GRTSStatusID = lookup.GRTSStatus.ID LEFT OUTER JOIN
                         lookup.GRTSDraw ON Site_1.GRTSDrawID = lookup.GRTSDraw.ID LEFT OUTER JOIN
                         lookup.ProtectedStatus ON Site_1.ProtectedStatusID = lookup.ProtectedStatus.ID LEFT OUTER JOIN
                         lookup.Subunit ON Site_1.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Site';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'= 1044
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
         Width = 1065
         Width = 1695
         Width = 1695
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1725
         Width = 1725
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
         Alias = 2265
         Table = 1560
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Site';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[36] 2[14] 3) )"
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
         Begin Table = "Site_1"
            Begin Extent = 
               Top = 0
               Left = 19
               Bottom = 390
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Park"
            Begin Extent = 
               Top = 8
               Left = 615
               Bottom = 138
               Right = 785
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSPanel (lookup)"
            Begin Extent = 
               Top = 302
               Left = 514
               Bottom = 415
               Right = 684
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSStatus (lookup)"
            Begin Extent = 
               Top = 288
               Left = 800
               Bottom = 418
               Right = 970
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSDraw (lookup)"
            Begin Extent = 
               Top = 177
               Left = 609
               Bottom = 307
               Right = 779
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 96
               Left = 336
               Bottom = 226
               Right = 506
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 61
               Left = 874
               Bottom = 191
               Right ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Site';



