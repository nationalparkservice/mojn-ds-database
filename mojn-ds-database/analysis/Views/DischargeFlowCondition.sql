﻿CREATE VIEW analysis.DischargeFlowCondition
AS
SELECT        intermediate.Discharge.ParkCode, intermediate.Discharge.SiteCode, intermediate.Discharge.SiteName, intermediate.Discharge.VisitDate, intermediate.Discharge.VisitGroup, 
                         intermediate.Discharge.FlowCondition, lookup.SpringbrookLengthFlag.Code AS SpringbrookLengthFlag, data.SpringbrookDimensions.SpringbrookLength_m, data.SpringbrookDimensions.SpringbrookWidth_m, 
                         intermediate.Discharge.VisitType, intermediate.Discharge.DPL
FROM            lookup.SpringbrookLengthFlag INNER JOIN
                         data.SpringbrookDimensions ON lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID RIGHT OUTER JOIN
                         intermediate.Discharge ON data.SpringbrookDimensions.DischargeActivityID = intermediate.Discharge.DischargeActivityID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DischargeFlowCondition';




GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[44] 4[39] 2[12] 3) )"
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
         Begin Table = "SpringbrookLengthFlag (lookup)"
            Begin Extent = 
               Top = 270
               Left = 881
               Bottom = 400
               Right = 1051
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SpringbrookDimensions (data)"
            Begin Extent = 
               Top = 61
               Left = 593
               Bottom = 250
               Right = 817
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Discharge (intermediate)"
            Begin Extent = 
               Top = 75
               Left = 104
               Bottom = 337
               Right = 488
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
         Column = 2520
         Alias = 1635
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DischargeFlowCondition';





