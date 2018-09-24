CREATE VIEW analysis.Invasives
AS
SELECT        intermediate.SiteVisit.ParkCode, intermediate.SiteVisit.SiteCode, intermediate.SiteVisit.SiteName, intermediate.SiteVisit.VisitDate, intermediate.SiteVisit.VisitGroup, 
                         lookup.InvasivesObserved.Code AS InvasivesObserved, lookup.RiparianVegetationBuffer.Code AS InRiparianVegBuffer, ref.Taxon.USDAPlantsCode, ref.Taxon.ScientificName, intermediate.SiteVisit.VisitType, 
                         lookup.ProtectedStatus.Code AS ProtectedStatus, DPL.Label AS DPL
FROM            lookup.ProtectedStatus RIGHT OUTER JOIN
                         intermediate.SiteVisit INNER JOIN
                         data.InvasivesActivity ON intermediate.SiteVisit.VisitID = data.InvasivesActivity.VisitID LEFT OUTER JOIN
                         lookup.InvasivesObserved ON data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID AND data.InvasivesActivity.InvasivesObservedID = lookup.InvasivesObserved.ID LEFT OUTER JOIN
                         data.InvasivesObservation ON data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND 
                         data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID AND 
                         data.InvasivesActivity.ID = data.InvasivesObservation.InvasivesActivityID LEFT OUTER JOIN
                         lookup.RiparianVegetationBuffer ON data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND 
                         data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND 
                         data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND 
                         data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID AND data.InvasivesObservation.RiparianVegetationBufferID = lookup.RiparianVegetationBuffer.ID ON 
                         lookup.ProtectedStatus.ID = data.InvasivesObservation.ProtectedStatusID LEFT OUTER JOIN
                         ref.Taxon ON data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND 
                         data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND data.InvasivesObservation.TaxonID = ref.Taxon.ID AND 
                         data.InvasivesObservation.TaxonID = ref.Taxon.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND 
                         data.InvasivesActivity.DataProcessingLevelID = DPL.ID AND data.InvasivesActivity.DataProcessingLevelID = DPL.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Invasives';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'       Left = 1011
               Bottom = 528
               Right = 1329
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 245
               Left = 720
               Bottom = 375
               Right = 890
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
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
         Width = 1650
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1575
         Alias = 2205
         Table = 2910
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
         Configuration = "(H (1[34] 4[41] 2[12] 3) )"
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
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 171
               Left = 1188
               Bottom = 306
               Right = 1358
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SiteVisit (intermediate)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesActivity (data)"
            Begin Extent = 
               Top = 87
               Left = 292
               Bottom = 289
               Right = 515
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesObserved (lookup)"
            Begin Extent = 
               Top = 305
               Left = 555
               Bottom = 433
               Right = 725
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "InvasivesObservation (data)"
            Begin Extent = 
               Top = 73
               Left = 644
               Bottom = 203
               Right = 905
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RiparianVegetationBuffer (lookup)"
            Begin Extent = 
               Top = 7
               Left = 1122
               Bottom = 138
               Right = 1394
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Taxon (ref)"
            Begin Extent = 
               Top = 338
        ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Invasives';





