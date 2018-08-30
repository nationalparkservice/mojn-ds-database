CREATE VIEW analysis.Invasives
AS
SELECT        P.Code AS ParkCode, S.Code AS SiteCode, S.Name AS SiteName, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, lookup.RiparianVegetationBuffer.Code, ref.Taxon.USDAPlantsCode, 
                         ref.Taxon.ScientificName, lookup.VisitType.Label AS VisitType, lookup.ProtectedStatus.Code AS ProtectedStatus, DPL.Label AS DPL
FROM            data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID INNER JOIN
                         lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND 
                         V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID INNER JOIN
                         lookup.MonitoringStatus ON V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND 
                         V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID INNER JOIN
                         data.InvasivesActivity ON V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND 
                         V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND 
                         V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID AND V.ID = data.InvasivesActivity.VisitID INNER JOIN
                         data.InvasivesObservation ON data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND 
                         data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND 
                         data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND lookup.ProtectedStatus.ID = data.InvasivesObservation.ProtectedStatusID INNER JOIN
                         lookup.RiparianVegetationBuffer ON data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND 
                         data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND 
                         data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND 
                         data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID INNER JOIN
                         ref.Taxon ON data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND 
                         data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND 
                         data.InvasivesObservation.TaxonID = ref.Taxon.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Invasives';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'       DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesActivity (data)"
            Begin Extent = 
               Top = 256
               Left = 412
               Bottom = 386
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesObservation (data)"
            Begin Extent = 
               Top = 421
               Left = 25
               Bottom = 551
               Right = 286
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "RiparianVegetationBuffer (lookup)"
            Begin Extent = 
               Top = 475
               Left = 346
               Bottom = 606
               Right = 618
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Taxon (ref)"
            Begin Extent = 
               Top = 396
               Left = 695
               Bottom = 586
               Right = 1013
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Invasives';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[15] 2[20] 3) )"
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
               Left = 301
               Bottom = 136
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "V"
            Begin Extent = 
               Top = 6
               Left = 548
               Bottom = 136
               Right = 771
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 809
               Bottom = 136
               Right = 979
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 106
               Left = 30
               Bottom = 241
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 148
               Left = 292
               Bottom = 278
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MonitoringStatus (lookup)"
            Begin Extent = 
               Top = 117
               Left = 746
               Bottom = 247
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 256
               Left = 768
               Bottom = 386
               Right = 938
            End
     ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Invasives';

