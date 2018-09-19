CREATE VIEW analysis.DisturbanceFlowModification
AS
SELECT        intermediate.SiteVisit.ParkCode, intermediate.SiteVisit.SiteCode, intermediate.SiteVisit.SiteName, intermediate.SiteVisit.VisitDate, intermediate.SiteVisit.VisitGroup, 
                         lookup.FlowModificationStatus.Label AS FlowModificationStatus, lookup.ModificationType.Label AS ModificationType, intermediate.SiteVisit.VisitType, lookup.DataProcessingLevel.Label AS DPL
FROM            lookup.ModificationType RIGHT OUTER JOIN
                         data.DisturbanceFlowModification AS DisturbanceFlowModification_1 ON lookup.ModificationType.ID = DisturbanceFlowModification_1.ModificationTypeID AND 
                         lookup.ModificationType.ID = DisturbanceFlowModification_1.ModificationTypeID AND lookup.ModificationType.ID = DisturbanceFlowModification_1.ModificationTypeID RIGHT OUTER JOIN
                         data.DisturbanceActivity INNER JOIN
                         intermediate.SiteVisit ON data.DisturbanceActivity.VisitID = intermediate.SiteVisit.VisitID LEFT OUTER JOIN
                         lookup.DataProcessingLevel ON data.DisturbanceActivity.DataProcessingLevelID = lookup.DataProcessingLevel.ID AND data.DisturbanceActivity.DataProcessingLevelID = lookup.DataProcessingLevel.ID ON 
                         DisturbanceFlowModification_1.DisturbanceActivityID = data.DisturbanceActivity.ID LEFT OUTER JOIN
                         lookup.FlowModificationStatus ON data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DisturbanceFlowModification';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'faults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2460
         Width = 1905
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2460
         Table = 3765
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DisturbanceFlowModification';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[20] 4[28] 2[28] 3) )"
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
         Begin Table = "ModificationType (lookup)"
            Begin Extent = 
               Top = 206
               Left = 1222
               Bottom = 336
               Right = 1392
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DisturbanceFlowModification_1"
            Begin Extent = 
               Top = 152
               Left = 816
               Bottom = 291
               Right = 1053
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DisturbanceActivity (data)"
            Begin Extent = 
               Top = 14
               Left = 338
               Bottom = 404
               Right = 563
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DataProcessingLevel (lookup)"
            Begin Extent = 
               Top = 248
               Left = 617
               Bottom = 378
               Right = 787
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FlowModificationStatus (lookup)"
            Begin Extent = 
               Top = 29
               Left = 1033
               Bottom = 142
               Right = 1298
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
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDe', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DisturbanceFlowModification';



