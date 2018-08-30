CREATE VIEW analysis.Visit
AS
SELECT        P.Code AS ParkCode, lookup.Subunit.Label AS Subunit, S.Code AS SiteCode, S.Name AS SiteName, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, lookup.GRTSPanel.Code AS SampleFrame, 
                         lookup.VisitType.Label AS VisitType, lookup.MonitoringStatus.Label AS MonitoringStatus, lookup.SpringType.Label AS SpringType, DPL.Label AS DPL
FROM            data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.GRTSPanel ON S.GRTSPanelID = lookup.GRTSPanel.ID INNER JOIN
                         lookup.GRTSStatus ON S.GRTSStatusID = lookup.GRTSStatus.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID INNER JOIN
                         lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND 
                         V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID INNER JOIN
                         lookup.MonitoringStatus ON V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND 
                         V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID LEFT OUTER JOIN
                         lookup.SpringType ON V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID AND 
                         V.SpringTypeID = lookup.SpringType.ID AND V.SpringTypeID = lookup.SpringType.ID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON V.DataProcessingLevelID = DPL.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Visit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'        DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 186
               Left = 573
               Bottom = 316
               Right = 743
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SpringType (lookup)"
            Begin Extent = 
               Top = 255
               Left = 781
               Bottom = 385
               Right = 951
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 173
               Left = 562
               Bottom = 303
               Right = 732
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MonitoringStatus (lookup)"
            Begin Extent = 
               Top = 318
               Left = 568
               Bottom = 483
               Right = 738
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
      Begin ColumnWidths = 15
         Width = 284
         Width = 720
         Width = 1500
         Width = 2145
         Width = 1845
         Width = 1185
         Width = 1500
         Width = 1500
         Width = 1725
         Width = 2010
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2340
         Alias = 1995
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Visit';


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
               Bottom = 351
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
         Begin Table = "GRTSPanel (lookup)"
            Begin Extent = 
               Top = 6
               Left = 754
               Bottom = 119
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSStatus (lookup)"
            Begin Extent = 
               Top = 120
               Left = 754
               Bottom = 250
               Right = 924
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 148
               Left = 27
               Bottom = 278
               Right = 197
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 280
               Left = 35
               Bottom = 410
               Right = 205
            End
    ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Visit';

