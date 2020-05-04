CREATE VIEW export.WY20_SensorMostRecent
AS
SELECT        v.ParkCode, v.SiteCode, v.SiteName, v.VisitDate, v.VisitGroup, v.SpringType, v.Notes AS VisitNotes, v.SampleFrame, pd.Code AS PhotoType, p.UtmX_m, p.UtmY_m, z.Code AS UTMZone, sd.Notes AS SensorNotes
FROM            (SELECT        SiteCode, MAX(VisitDate) AS MostRecentVisit
                          FROM            intermediate.SiteVisit
                          WHERE        (VisitType = 'Primary')
                          GROUP BY SiteCode) AS rv INNER JOIN
                         intermediate.SiteVisit AS v ON v.SiteCode = rv.SiteCode AND v.VisitDate = rv.MostRecentVisit LEFT OUTER JOIN
                         data.PhotoActivity AS pa ON pa.VisitID = v.VisitID LEFT OUTER JOIN
                         data.Photo AS p ON p.PhotoActivityID = pa.ID LEFT OUTER JOIN
                         ref.PhotoDescriptionCode AS pd ON p.PhotoDescriptionCodeID = pd.ID LEFT OUTER JOIN
                         lookup.UTMZone AS z ON p.UTMZoneID = z.ID LEFT OUTER JOIN
                         data.SensorDeployment AS sd ON sd.VisitID = v.VisitID
GROUP BY v.ParkCode, v.SiteCode, v.SiteName, v.VisitDate, v.VisitGroup, v.SpringType, v.Notes, v.SampleFrame, pd.Code, p.UtmX_m, p.UtmY_m, z.Code, sd.Notes
HAVING        (pd.Code = 'SENSOR') AND (v.SampleFrame = 'Annual') OR
                         (pd.Code = 'SENSOR') AND (v.SampleFrame = '3Yr') AND (v.ParkCode = 'JOTR' OR
                         v.ParkCode = 'PARA')
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'export', @level1type = N'VIEW', @level1name = N'WY20_SensorMostRecent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'
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
         Width = 2805
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
      Begin ColumnWidths = 12
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
', @level0type = N'SCHEMA', @level0name = N'export', @level1type = N'VIEW', @level1name = N'WY20_SensorMostRecent';


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
         Begin Table = "rv"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 136
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pa"
            Begin Extent = 
               Top = 6
               Left = 512
               Bottom = 136
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 789
               Bottom = 136
               Right = 1025
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pd"
            Begin Extent = 
               Top = 102
               Left = 38
               Bottom = 232
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "z"
            Begin Extent = 
               Top = 138
               Left = 281
               Bottom = 268
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sd"
            Begin Extent = 
               Top = 138
               Left = 505
               Bottom = 268
               Right = 735
            End
            DisplayFlags = 280
            TopColumn = 0
         End', @level0type = N'SCHEMA', @level0name = N'export', @level1type = N'VIEW', @level1name = N'WY20_SensorMostRecent';

