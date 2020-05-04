CREATE VIEW intermediate.Discharge
AS
SELECT        lookup.FlowCondition.Label AS FlowCondition, DPL.Label AS DPL, intermediate.SiteVisit.Park, intermediate.SiteVisit.SiteCode, intermediate.SiteVisit.SiteName, intermediate.SiteVisit.VisitDate, intermediate.SiteVisit.VisitType, 
                         intermediate.SiteVisit.FieldSeason, data.DischargeActivity.ID AS DischargeActivityID, data.DischargeActivity.Notes
FROM            intermediate.SiteVisit INNER JOIN
                         data.DischargeActivity ON intermediate.SiteVisit.VisitID = data.DischargeActivity.VisitID LEFT OUTER JOIN
                         lookup.FlowCondition ON data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.DischargeActivity.DataProcessingLevelID = DPL.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'Discharge';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'       Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'Discharge';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[23] 2[22] 3) )"
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
         Begin Table = "DischargeActivity (data)"
            Begin Extent = 
               Top = 28
               Left = 347
               Bottom = 248
               Right = 570
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FlowCondition (lookup)"
            Begin Extent = 
               Top = 32
               Left = 834
               Bottom = 186
               Right = 1004
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 150
               Left = 646
               Bottom = 315
               Right = 816
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
      Begin ColumnWidths = 11
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1785
         Table = 1905
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
  ', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'Discharge';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Intermediate view that includes site- and visit-level info for each discharge activity', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'Discharge';

