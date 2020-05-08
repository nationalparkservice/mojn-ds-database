CREATE VIEW analysis.SensorRetrievalAttempts
AS
SELECT        s.Label AS SensorNumber, s.SerialNumber, CAST(dv.VisitDate AS date) AS DeploymentDate, qa.Water_Year(dv.VisitDate) AS DeploymentFieldSeason, CAST(rv.VisitDate AS date) AS RetrievalDate, qa.Water_Year(rv.VisitDate) AS RetrievalFieldSeason, 
                         ds.Name AS SiteName, ds.Code AS SiteCode, p.Code AS Park, ret.Code AS SensorRetrieved, sp.Label AS SensorProblem, dld.Code AS DownloadResult, rvt.Label AS RetrievalVisitType, 
                         dvt.Label AS DeploymentVisitType
FROM            ref.Sensor AS s LEFT OUTER JOIN
                         data.SensorDeployment AS sd ON sd.SensorID = s.ID INNER JOIN
                         data.Visit AS dv ON sd.VisitID = dv.ID INNER JOIN
                         data.SensorRetrievalAttempt AS sr ON sr.SensorDeploymentID = sd.ID INNER JOIN
                         data.Visit AS rv ON sr.VisitID = rv.ID INNER JOIN
                         data.Site AS rs ON rv.SiteID = rs.ID INNER JOIN
                         data.Site AS ds ON dv.SiteID = ds.ID INNER JOIN
						 lookup.Park AS p ON ds.ParkID = p.ID INNER JOIN
                         lookup.VisitType AS rvt ON rv.VisitTypeID = rvt.ID INNER JOIN
                         lookup.VisitType AS dvt ON dv.VisitTypeID = dvt.ID LEFT OUTER JOIN
                         lookup.SensorProblem AS sp ON sr.SensorProblemID = sp.ID LEFT OUTER JOIN
                         lookup.IsSensorRetrieved AS ret ON sr.IsSensorRetrievedID = ret.ID LEFT OUTER JOIN
                         lookup.IsDownloadSuccessful AS dld ON sr.IsDownloadSuccessfulID = dld.ID

GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'SensorRetrievalAttempts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'       End
         Begin Table = "sp"
            Begin Extent = 
               Top = 185
               Left = 612
               Bottom = 298
               Right = 782
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ret"
            Begin Extent = 
               Top = 372
               Left = 617
               Bottom = 485
               Right = 787
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dld"
            Begin Extent = 
               Top = 393
               Left = 963
               Bottom = 506
               Right = 1133
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rvt"
            Begin Extent = 
               Top = 454
               Left = 171
               Bottom = 584
               Right = 341
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dvt"
            Begin Extent = 
               Top = 210
               Left = 959
               Bottom = 340
               Right = 1129
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'SensorRetrievalAttempts';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[19] 2[17] 3) )"
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
         Begin Table = "s"
            Begin Extent = 
               Top = 24
               Left = 32
               Bottom = 154
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sd"
            Begin Extent = 
               Top = 23
               Left = 522
               Bottom = 153
               Right = 736
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dv"
            Begin Extent = 
               Top = 69
               Left = 934
               Bottom = 199
               Right = 1157
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "sr"
            Begin Extent = 
               Top = 140
               Left = 234
               Bottom = 270
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rv"
            Begin Extent = 
               Top = 307
               Left = 75
               Bottom = 437
               Right = 298
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rs"
            Begin Extent = 
               Top = 487
               Left = 472
               Bottom = 617
               Right = 681
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ds"
            Begin Extent = 
               Top = 77
               Left = 1200
               Bottom = 207
               Right = 1409
            End
            DisplayFlags = 280
            TopColumn = 0
  ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'SensorRetrievalAttempts';

