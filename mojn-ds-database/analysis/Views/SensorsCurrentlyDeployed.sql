CREATE VIEW analysis.SensorsCurrentlyDeployed
AS
SELECT        s.Label AS SensorNumber, s.SerialNumber, ds.Code AS SpringCode, ds.Name AS SpringName, dv.VisitDate AS DeploymentDate, qa.Water_Year(dv.VisitDate) AS DeploymentFieldSeason, lookup.Park.Code AS Park, 
                         lookup.VisitType.Label AS DeploymentVisitType
FROM            data.SensorRetrievalAttempt AS sr RIGHT OUTER JOIN
                         ref.Sensor AS s LEFT OUTER JOIN
                         data.SensorDeployment AS sd ON sd.SensorID = s.ID INNER JOIN
                         data.Visit AS dv ON sd.VisitID = dv.ID INNER JOIN
                         lookup.VisitType ON dv.VisitTypeID = lookup.VisitType.ID AND dv.VisitTypeID = lookup.VisitType.ID ON sr.SensorDeploymentID = sd.ID LEFT OUTER JOIN
                         lookup.Park INNER JOIN
                         data.Site AS ds ON lookup.Park.ID = ds.ParkID AND lookup.Park.ID = ds.ParkID ON dv.SiteID = ds.ID
WHERE        (sr.ID IS NULL)
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'SensorsCurrentlyDeployed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'   TopColumn = 0
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'SensorsCurrentlyDeployed';


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
         Begin Table = "sr"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 255
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sd"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dv"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 7
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 123
               Left = 469
               Bottom = 253
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Park (lookup)"
            Begin Extent = 
               Top = 393
               Left = 331
               Bottom = 523
               Right = 501
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ds"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 247
            End
            DisplayFlags = 280
         ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'SensorsCurrentlyDeployed';

