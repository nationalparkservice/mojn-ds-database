CREATE VIEW analysis.Riparian
AS
SELECT        P.Code AS ParkCode, S.Code AS SiteCode, S.Name AS SiteName, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, lookup.LifeForm.Label AS LifeForm, data.RiparianVegetationObservation.Rank, 
                         data.RiparianVegetationObservation.DominantSpecies, lookup.VisitType.Label AS VisitType, lookup.ProtectedStatus.Code AS ProtectedStatus, DPL.Label AS DPL
FROM            lookup.LifeForm INNER JOIN
                         data.RiparianVegetationObservation ON lookup.LifeForm.ID = data.RiparianVegetationObservation.LifeFormID AND lookup.LifeForm.ID = data.RiparianVegetationObservation.LifeFormID AND 
                         lookup.LifeForm.ID = data.RiparianVegetationObservation.LifeFormID AND lookup.LifeForm.ID = data.RiparianVegetationObservation.LifeFormID AND 
                         lookup.LifeForm.ID = data.RiparianVegetationObservation.LifeFormID AND lookup.LifeForm.ID = data.RiparianVegetationObservation.LifeFormID AND 
                         lookup.LifeForm.ID = data.RiparianVegetationObservation.LifeFormID LEFT OUTER JOIN
                         data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID INNER JOIN
                         lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND 
                         V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID INNER JOIN
                         lookup.MonitoringStatus ON V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND 
                         V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID INNER JOIN
                         data.RiparianVegetationActivity ON V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND 
                         V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND 
                         V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND V.ID = data.RiparianVegetationActivity.VisitID AND 
                         V.ID = data.RiparianVegetationActivity.VisitID ON data.RiparianVegetationObservation.ProtectedStatusID = lookup.ProtectedStatus.ID AND 
                         data.RiparianVegetationObservation.ProtectedStatusID = lookup.ProtectedStatus.ID AND data.RiparianVegetationObservation.RiparianVegetationActivityID = data.RiparianVegetationActivity.ID AND 
                         data.RiparianVegetationObservation.RiparianVegetationActivityID = data.RiparianVegetationActivity.ID AND 
                         data.RiparianVegetationObservation.RiparianVegetationActivityID = data.RiparianVegetationActivity.ID AND 
                         data.RiparianVegetationObservation.RiparianVegetationActivityID = data.RiparianVegetationActivity.ID AND 
                         data.RiparianVegetationObservation.RiparianVegetationActivityID = data.RiparianVegetationActivity.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Riparian';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'      DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 270
               Left = 753
               Bottom = 400
               Right = 923
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RiparianVegetationActivity (data)"
            Begin Extent = 
               Top = 406
               Left = 35
               Bottom = 536
               Right = 258
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RiparianVegetationObservation (data)"
            Begin Extent = 
               Top = 433
               Left = 344
               Bottom = 599
               Right = 605
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "LifeForm (lookup)"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
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
         Table = 3240
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Riparian';


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
         Begin Table = "S"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 508
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 546
               Bottom = 136
               Right = 716
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 118
               Left = 792
               Bottom = 248
               Right = 962
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MonitoringStatus (lookup)"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 294
               Left = 359
               Bottom = 424
               Right = 529
            End
      ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Riparian';

