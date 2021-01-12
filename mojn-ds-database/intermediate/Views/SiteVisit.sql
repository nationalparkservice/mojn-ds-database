CREATE VIEW intermediate.SiteVisit
AS
SELECT        Park.Code AS Park, Site.Code AS SiteCode, Site.Name AS SiteName, CAST(Visit.VisitDate AS DATE) AS VisitDate, CAST(Visit.StartTime AS TIME) AS StartTime, qa.Water_Year(Visit.VisitDate) AS FieldSeason, 
                         lookup.VisitType.Label AS VisitType, Visit.ID AS VisitID, lookup.Subunit.Label AS Subunit, lookup.ProtectedStatus.Label AS ProtectedStatus, lookup.MonitoringStatus.Label AS MonitoringStatus, 
                         lookup.SpringType.Label AS SpringType, Visit.Notes, lookup.DataProcessingLevel.Label AS DataProcessingLevel, lookup.GRTSPanel.Code AS SampleFrame, Visit.MonitoringStatusID
FROM            lookup.SpringType RIGHT OUTER JOIN
                         lookup.DataProcessingLevel RIGHT OUTER JOIN
                         lookup.GRTSPanel RIGHT OUTER JOIN
                         lookup.MonitoringStatus RIGHT OUTER JOIN
                         data.Site AS Site INNER JOIN
                         lookup.Park AS Park ON Site.ParkID = Park.ID INNER JOIN
                         data.Visit AS Visit ON Site.ID = Visit.SiteID ON lookup.MonitoringStatus.ID = Visit.MonitoringStatusID ON lookup.GRTSPanel.ID = Site.GRTSPanelID ON lookup.DataProcessingLevel.ID = Visit.DataProcessingLevelID ON 
                         lookup.SpringType.ID = Visit.SpringTypeID LEFT OUTER JOIN
                         lookup.VisitType ON Visit.VisitTypeID = lookup.VisitType.ID LEFT OUTER JOIN
                         lookup.ProtectedStatus ON Site.ProtectedStatusID = lookup.ProtectedStatus.ID LEFT OUTER JOIN
                         lookup.Subunit ON Site.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'SiteVisit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N' = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 664
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 534
               Left = 246
               Bottom = 664
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 796
               Right = 208
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
', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'SiteVisit';


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
         Top = -384
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SpringType (lookup)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DataProcessingLevel (lookup)"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSPanel (lookup)"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 251
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
         Begin Table = "Site"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Park"
            Begin Extent = 
               Top = 270
               Left = 285
               Bottom = 400
               Right = 455
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Visit"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'SiteVisit';

