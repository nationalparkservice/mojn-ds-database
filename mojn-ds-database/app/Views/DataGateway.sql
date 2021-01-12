CREATE VIEW app.DataGateway
AS
SELECT        S.ID AS SiteID, V.ID AS VisitID, S.Code AS SiteCode, S.Name AS SiteName, P.Code AS ParkCode, lookup.Subunit.Label AS Subunit, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, lookup.GRTSStatus.Code AS SiteStatus, 
                         lookup.GRTSPanel.Code AS SampleFrame, app.VisitDPL.MinDPL AS DPL, lookup.ProtectedStatus.Label AS SiteProtectedStatus, S.ParkID, S.SubunitID, V.DataProcessingLevelID, S.GRTSStatusID AS SiteStatusID, 
                         S.GRTSPanelID AS SampleFrameID
FROM            data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.GRTSPanel ON S.GRTSPanelID = lookup.GRTSPanel.ID INNER JOIN
                         lookup.GRTSStatus ON S.GRTSStatusID = lookup.GRTSStatus.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID LEFT OUTER JOIN
                         app.VisitDPL ON V.ID = app.VisitDPL.VisitID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[24] 2[16] 3) )"
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
               Top = 24
               Left = 8
               Bottom = 177
               Right = 203
            End
            DisplayFlags = 280
            TopColumn = 13
         End
         Begin Table = "V"
            Begin Extent = 
               Top = 201
               Left = 286
               Bottom = 331
               Right = 509
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 15
               Left = 541
               Bottom = 145
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSPanel (lookup)"
            Begin Extent = 
               Top = 252
               Left = 14
               Bottom = 393
               Right = 184
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GRTSStatus (lookup)"
            Begin Extent = 
               Top = 181
               Left = 6
               Bottom = 311
               Right = 176
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProtectedStatus (lookup)"
            Begin Extent = 
               Top = 348
               Left = 234
               Bottom = 478
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 65
               Left = 295
               Bottom = 195
               Right = 465
            End
', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'VIEW', @level1name = N'DataGateway';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitDPL (app)"
            Begin Extent = 
               Top = 237
               Left = 769
               Bottom = 350
               Right = 949
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
      Begin ColumnWidths = 18
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
         Column = 2220
         Alias = 1965
         Table = 1815
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
', @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'VIEW', @level1name = N'DataGateway';




GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'app', @level1type = N'VIEW', @level1name = N'DataGateway';

