CREATE VIEW analysis.Disturbance
AS
SELECT        P.Code AS ParkCode, S.Code AS SiteCode, S.Name AS SiteName, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, data.DisturbanceActivity.Roads, data.DisturbanceActivity.HumanUse, 
                         data.DisturbanceActivity.PlantManagement, data.DisturbanceActivity.HikingTrails, data.DisturbanceActivity.Livestock, data.DisturbanceActivity.OtherAnthropogenic, data.DisturbanceActivity.Fire, 
                         data.DisturbanceActivity.Flooding, data.DisturbanceActivity.Wildlife, data.DisturbanceActivity.OtherNatural, data.DisturbanceActivity.Overall, lookup.FlowModificationStatus.Label AS FlowModificationStatus, 
                         lookup.VisitType.Label AS VisitType, DPL.Label AS DPL
FROM            data.DisturbanceActivity INNER JOIN
                         data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID INNER JOIN
                         lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND 
                         V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID INNER JOIN
                         lookup.MonitoringStatus ON V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND 
                         V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID ON 
                         data.DisturbanceActivity.VisitID = V.ID INNER JOIN
                         lookup.FlowModificationStatus ON data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID AND 
                         data.DisturbanceActivity.FlowModificationStatusID = lookup.FlowModificationStatus.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.DisturbanceActivity.DataProcessingLevelID = DPL.ID AND data.DisturbanceActivity.DataProcessingLevelID = DPL.ID AND 
                         data.DisturbanceActivity.DataProcessingLevelID = DPL.ID AND data.DisturbanceActivity.DataProcessingLevelID = DPL.ID AND data.DisturbanceActivity.DataProcessingLevelID = DPL.ID AND 
                         data.DisturbanceActivity.DataProcessingLevelID = DPL.ID AND data.DisturbanceActivity.DataProcessingLevelID = DPL.ID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Disturbance';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'  DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 291
               Left = 56
               Bottom = 421
               Right = 226
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DisturbanceActivity (data)"
            Begin Extent = 
               Top = 148
               Left = 531
               Bottom = 278
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "FlowModificationStatus (lookup)"
            Begin Extent = 
               Top = 172
               Left = 884
               Bottom = 285
               Right = 1054
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Disturbance';


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
               Top = 6
               Left = 754
               Bottom = 136
               Right = 924
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
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 305
               Left = 490
               Bottom = 435
               Right = 660
            End
          ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Disturbance';

