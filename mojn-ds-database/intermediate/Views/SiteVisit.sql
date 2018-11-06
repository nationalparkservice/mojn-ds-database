CREATE VIEW intermediate.SiteVisit
AS
SELECT        Park.Code AS ParkCode, Site.Code AS SiteCode, Site.Name AS SiteName, Visit.VisitDate, qa.Water_Year(Visit.VisitDate) AS VisitGroup, lookup.VisitType.Label AS VisitType, Visit.ID AS VisitID, 
                         lookup.Subunit.Label AS Subunit, lookup.ProtectedStatus.Label AS ProtectedStatus, lookup.MonitoringStatus.Label AS MonitoringStatus, lookup.SpringType.Label AS SpringType, 
                         lookup.DataProcessingLevel.Label AS VisitDPL, lookup.GRTSPanel.Code AS SampleFrame, Visit.MonitoringStatusID
FROM            lookup.SpringType RIGHT OUTER JOIN
                         lookup.DataProcessingLevel RIGHT OUTER JOIN
                         lookup.GRTSPanel RIGHT OUTER JOIN
                         lookup.MonitoringStatus RIGHT OUTER JOIN
                         data.Site AS Site INNER JOIN
                         lookup.Park AS Park ON Site.ParkID = Park.ID INNER JOIN
                         data.Visit AS Visit ON Site.ID = Visit.SiteID ON lookup.MonitoringStatus.ID = Visit.MonitoringStatusID ON lookup.GRTSPanel.ID = Site.GRTSPanelID ON 
                         lookup.DataProcessingLevel.ID = Visit.DataProcessingLevelID ON lookup.SpringType.ID = Visit.SpringTypeID LEFT OUTER JOIN
                         lookup.VisitType ON Visit.VisitTypeID = lookup.VisitType.ID LEFT OUTER JOIN
                         lookup.ProtectedStatus ON Site.ProtectedStatusID = lookup.ProtectedStatus.ID LEFT OUTER JOIN
                         lookup.Subunit ON Site.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'SiteVisit';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'Right = 851
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 157
               Left = 304
               Bottom = 287
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 390
               Left = 977
               Bottom = 530
               Right = 1148
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 189
               Left = 874
               Bottom = 341
               Right = 1044
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1230
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1470
         Table = 2190
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
         Configuration = "(H (1[62] 4[3] 2[32] 3) )"
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
         Left = -144
      End
      Begin Tables = 
         Begin Table = "SpringType (lookup)"
            Begin Extent = 
               Top = 325
               Left = 333
               Bottom = 455
               Right = 503
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DataProcessingLevel (lookup)"
            Begin Extent = 
               Top = 204
               Left = 135
               Bottom = 357
               Right = 342
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "GRTSPanel (lookup)"
            Begin Extent = 
               Top = 334
               Left = 782
               Bottom = 447
               Right = 952
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MonitoringStatus (lookup)"
            Begin Extent = 
               Top = 8
               Left = 287
               Bottom = 168
               Right = 456
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Site"
            Begin Extent = 
               Top = 25
               Left = 1160
               Bottom = 335
               Right = 1369
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Park"
            Begin Extent = 
               Top = 45
               Left = 865
               Bottom = 175
               Right = 1035
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Visit"
            Begin Extent = 
               Top = 25
               Left = 628
               Bottom = 307
               ', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'SiteVisit';



