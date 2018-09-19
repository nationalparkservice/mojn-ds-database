﻿CREATE VIEW analysis.DischargeEstimated
AS
SELECT        intermediate.Discharge.ParkCode, intermediate.Discharge.SiteCode, intermediate.Discharge.SiteName, intermediate.Discharge.VisitDate, intermediate.Discharge.VisitGroup, 
                         intermediate.Discharge.FlowCondition, lookup.DischargeEstimatedFlag.Code AS DischargeFlag, data.DischargeEstimatedObservation.Discharge_L_per_min, intermediate.Discharge.VisitType, 
                         intermediate.Discharge.DPL, intermediate.Discharge.DischargeActivityID
FROM            intermediate.Discharge INNER JOIN
                         data.DischargeEstimatedObservation ON intermediate.Discharge.DischargeActivityID = data.DischargeEstimatedObservation.DischargeActivityID LEFT OUTER JOIN
                         lookup.DischargeEstimatedFlag ON data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID AND 
                         data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID AND 
                         data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID AND 
                         data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID AND 
                         data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID AND 
                         data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID AND 
                         data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID AND data.DischargeEstimatedObservation.DischargeEstimatedFlagID = lookup.DischargeEstimatedFlag.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DischargeEstimated';




GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[9] 2[17] 3) )"
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
         Begin Table = "DischargeEstimatedObservation (data)"
            Begin Extent = 
               Top = 9
               Left = 298
               Bottom = 171
               Right = 524
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DischargeEstimatedFlag (lookup)"
            Begin Extent = 
               Top = 97
               Left = 600
               Bottom = 218
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Discharge (intermediate)"
            Begin Extent = 
               Top = 0
               Left = 34
               Bottom = 238
               Right = 226
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
         Width = 2430
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1980
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
         Alias = 1800
         Table = 3510
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DischargeEstimated';



