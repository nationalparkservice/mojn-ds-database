CREATE VIEW analysis.Riparian
AS
SELECT        intermediate.SiteVisit.ParkCode, intermediate.SiteVisit.SiteCode, intermediate.SiteVisit.SiteName, intermediate.SiteVisit.VisitDate, intermediate.SiteVisit.VisitGroup, 
                         lookup.IsVegetationObserved.Code AS IsVegetationObserved, lookup.MistletoePresent.Code AS MistletoePresent, lookup.LifeForm.Label AS LifeForm, data.RiparianVegetationObservation.Rank, 
                         data.RiparianVegetationObservation.DominantSpecies, ref.Taxon.USDAPlantsCode, ref.Taxon.ScientificName, intermediate.SiteVisit.VisitType, lookup.ProtectedStatus.Code AS ProtectedStatus, 
                         DPL.Label AS DPL
FROM            lookup.MistletoePresent RIGHT OUTER JOIN
                         lookup.IsVegetationObserved INNER JOIN
                         intermediate.SiteVisit INNER JOIN
                         data.RiparianVegetationActivity ON intermediate.SiteVisit.VisitID = data.RiparianVegetationActivity.VisitID ON lookup.IsVegetationObserved.ID = data.RiparianVegetationActivity.IsVegetationObservedID AND 
                         lookup.IsVegetationObserved.ID = data.RiparianVegetationActivity.IsVegetationObservedID AND lookup.IsVegetationObserved.ID = data.RiparianVegetationActivity.IsVegetationObservedID ON 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID AND 
                         lookup.MistletoePresent.ID = data.RiparianVegetationActivity.MistletoePresentID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID AND 
                         data.RiparianVegetationActivity.DataProcessingLevelID = DPL.ID LEFT OUTER JOIN
                         lookup.ProtectedStatus RIGHT OUTER JOIN
                         ref.Taxon RIGHT OUTER JOIN
                         data.RiparianVegetationObservation ON ref.Taxon.ID = data.RiparianVegetationObservation.TaxonID AND ref.Taxon.ID = data.RiparianVegetationObservation.TaxonID LEFT OUTER JOIN
                         lookup.LifeForm ON data.RiparianVegetationObservation.LifeFormID = lookup.LifeForm.ID AND data.RiparianVegetationObservation.LifeFormID = lookup.LifeForm.ID AND 
                         data.RiparianVegetationObservation.LifeFormID = lookup.LifeForm.ID AND data.RiparianVegetationObservation.LifeFormID = lookup.LifeForm.ID AND 
                         data.RiparianVegetationObservation.LifeFormID = lookup.LifeForm.ID AND data.RiparianVegetationObservation.LifeFormID = lookup.LifeForm.ID AND 
                         data.RiparianVegetationObservation.LifeFormID = lookup.LifeForm.ID ON lookup.ProtectedStatus.ID = data.RiparianVegetationObservation.ProtectedStatusID AND 
                         lookup.ProtectedStatus.ID = data.RiparianVegetationObservation.ProtectedStatusID ON data.RiparianVegetationActivity.ID = data.RiparianVegetationObservation.RiparianVegetationActivityID AND 
                         data.RiparianVegetationActivity.ID = data.RiparianVegetationObservation.RiparianVegetationActivityID AND 
                         data.RiparianVegetationActivity.ID = data.RiparianVegetationObservation.RiparianVegetationActivityID AND 
                         data.RiparianVegetationActivity.ID = data.RiparianVegetationObservation.RiparianVegetationActivityID AND data.RiparianVegetationActivity.ID = data.RiparianVegetationObservation.RiparianVegetationActivityID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Riparian';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'              Bottom = 401
               Right = 1418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RiparianVegetationObservation (data)"
            Begin Extent = 
               Top = 16
               Left = 817
               Bottom = 241
               Right = 1078
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LifeForm (lookup)"
            Begin Extent = 
               Top = 1
               Left = 1181
               Bottom = 131
               Right = 1351
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
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 4380
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
         Column = 1605
         Alias = 1935
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
         Configuration = "(H (1[28] 4[60] 2[6] 3) )"
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
         Begin Table = "MistletoePresent (lookup)"
            Begin Extent = 
               Top = 158
               Left = 41
               Bottom = 271
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "IsVegetationObserved (lookup)"
            Begin Extent = 
               Top = 279
               Left = 577
               Bottom = 402
               Right = 747
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
         Begin Table = "RiparianVegetationActivity (data)"
            Begin Extent = 
               Top = 40
               Left = 264
               Bottom = 262
               Right = 471
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 118
               Left = 613
               Bottom = 248
               Right = 783
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 135
               Left = 1245
               Bottom = 265
               Right = 1415
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Taxon (ref)"
            Begin Extent = 
               Top = 271
               Left = 1157
 ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Riparian';





