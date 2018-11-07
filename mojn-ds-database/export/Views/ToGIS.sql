CREATE VIEW export.ToGIS
AS
SELECT        lookup.Park.Code AS Park, data.Site.Name AS SiteName, data.Site.Code AS SiteCode, lookup.GRTSDraw.Code AS GRTSDraw, data.Site.GRTSOrder, lookup.GRTSPanel.Code AS SampleFrame, 
                         lookup.GRTSStatus.Code AS SiteStatus, MIN(data.Visit.VisitDate) AS EarliestVisit, MAX(data.Visit.VisitDate) AS LatestVisit, data.Site.Lat_WGS84, data.Site.Lon_WGS84, data.Site.X_UTM_NAD83_11N, 
                         data.Site.Y_UTM_NAD83_11N, data.Site.X_UTM_NAD83_12N, data.Site.Y_UTM_NAD83_12N
FROM            data.Site INNER JOIN
                         data.Visit ON data.Site.ID = data.Visit.SiteID INNER JOIN
                         lookup.Park ON data.Site.ParkID = lookup.Park.ID INNER JOIN
                         lookup.GRTSDraw ON data.Site.GRTSDrawID = lookup.GRTSDraw.ID INNER JOIN
                         lookup.GRTSPanel ON data.Site.GRTSPanelID = lookup.GRTSPanel.ID INNER JOIN
                         lookup.GRTSStatus ON data.Site.GRTSStatusID = lookup.GRTSStatus.ID
GROUP BY data.Site.Name, data.Site.Code, lookup.Park.Code, lookup.GRTSDraw.Code, lookup.GRTSPanel.Code, lookup.GRTSStatus.Code, data.Site.Lat_WGS84, data.Site.Lon_WGS84, data.Site.X_UTM_NAD83_11N, 
                         data.Site.Y_UTM_NAD83_11N, data.Site.X_UTM_NAD83_12N, data.Site.Y_UTM_NAD83_12N, data.Site.GRTSOrder
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'export', @level1type = N'VIEW', @level1name = N'ToGIS';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'   Width = 1500
         Width = 1500
         Width = 2340
         Width = 2340
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 1635
         Table = 2190
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
', @level0type = N'SCHEMA', @level0name = N'export', @level1type = N'VIEW', @level1name = N'ToGIS';


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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Site (data)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 387
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Visit (data)"
            Begin Extent = 
               Top = 7
               Left = 1005
               Bottom = 373
               Right = 1228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Park (lookup)"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 455
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSDraw (lookup)"
            Begin Extent = 
               Top = 6
               Left = 493
               Bottom = 136
               Right = 663
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSPanel (lookup)"
            Begin Extent = 
               Top = 6
               Left = 701
               Bottom = 119
               Right = 871
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSStatus (lookup)"
            Begin Extent = 
               Top = 120
               Left = 701
               Bottom = 250
               Right = 871
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
      Begin ColumnWidths = 9
         Width = 284
      ', @level0type = N'SCHEMA', @level0name = N'export', @level1type = N'VIEW', @level1name = N'ToGIS';

