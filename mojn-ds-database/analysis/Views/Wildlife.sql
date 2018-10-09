CREATE VIEW analysis.Wildlife
AS
SELECT        intermediate.SiteVisit.ParkCode, intermediate.SiteVisit.SiteCode, intermediate.SiteVisit.SiteName, intermediate.SiteVisit.VisitDate, intermediate.SiteVisit.VisitGroup, 
                         lookup.IsWildlifeObserved.Code AS IsWildlifeObserved, lookup.WildlifeType.Code AS Type, data.WildlifeObservation.SpeciesName, lookup.WildlifeEvidence.Label AS Evidence, intermediate.SiteVisit.VisitType, 
                         DPL.Label AS DPL
FROM            lookup.IsWildlifeObserved RIGHT OUTER JOIN
                         data.WildlifeActivity ON lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID AND lookup.IsWildlifeObserved.ID = data.WildlifeActivity.IsWildlifeObservedID LEFT OUTER JOIN
                         data.WildlifeObservation LEFT OUTER JOIN
                         lookup.WildlifeEvidence ON data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID LEFT OUTER JOIN
                         lookup.WildlifeType ON data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND 
                         data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND
                          data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND 
                         data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID ON 
                         data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND 
                         data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND 
                         data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND 
                         data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID RIGHT OUTER JOIN
                         intermediate.SiteVisit ON data.WildlifeActivity.VisitID = intermediate.SiteVisit.VisitID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WildlifeActivity.DataProcessingLevelID = DPL.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'               Bottom = 411
               Right = 730
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
         Width = 945
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1050
         Width = 1065
         Width = 2385
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
         Column = 1665
         Alias = 1455
         Table = 2175
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';






GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[18] 4[60] 2[11] 3) )"
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
         Begin Table = "IsWildlifeObserved (lookup)"
            Begin Extent = 
               Top = 14
               Left = 575
               Bottom = 147
               Right = 745
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WildlifeActivity (data)"
            Begin Extent = 
               Top = 81
               Left = 277
               Bottom = 321
               Right = 493
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "WildlifeObservation (data)"
            Begin Extent = 
               Top = 138
               Left = 779
               Bottom = 350
               Right = 995
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WildlifeEvidence (lookup)"
            Begin Extent = 
               Top = 262
               Left = 1094
               Bottom = 375
               Right = 1264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WildlifeType (lookup)"
            Begin Extent = 
               Top = 45
               Left = 1094
               Bottom = 175
               Right = 1264
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SiteVisit (intermediate)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 322
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 281
               Left = 560
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';





