/* Exclude legacy data from this view*/
CREATE VIEW analysis.Wildlife
AS
SELECT        sv.Park, sv.SiteCode, sv.SiteName, sv.VisitDate, sv.FieldSeason, iw.Label AS IsWildlifeObserved, wt.Label AS WildlifeType, do.Label AS DirectObservation, sc.Label AS Scat, tr.Label AS Tracks, sh.Label AS Shelter, 
                         fo.Label AS Foraging, vo.Label AS Vocalization, ot.Label AS OtherEvidence, wo.Notes, sv.VisitType, dpl.Label AS DPL
FROM            data.WildlifeActivity AS wa INNER JOIN
                         intermediate.SiteVisit AS sv ON wa.VisitID = sv.VisitID LEFT OUTER JOIN
                         lookup.IsWildlifeObserved AS iw ON wa.IsWildlifeObservedID = iw.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS dpl ON wa.DataProcessingLevelID = dpl.ID LEFT OUTER JOIN
                         data.WildlifeObservation AS wo ON wa.ID = wo.WildlifeActivityID LEFT OUTER JOIN
                         lookup.WildlifeType AS wt ON wo.WildlifeTypeID = wt.ID LEFT OUTER JOIN
                         lookup.WildlifeEvidencePresent AS do ON wo.DirectObservation = do.ID LEFT OUTER JOIN
                         lookup.WildlifeEvidencePresent AS sc ON wo.Scat = sc.ID LEFT OUTER JOIN
                         lookup.WildlifeEvidencePresent AS tr ON wo.Tracks = tr.ID LEFT OUTER JOIN
                         lookup.WildlifeEvidencePresent AS sh ON wo.Shelter = sh.ID LEFT OUTER JOIN
                         lookup.WildlifeEvidencePresent AS fo ON wo.Foraging = fo.ID LEFT OUTER JOIN
                         lookup.WildlifeEvidencePresent AS vo ON wo.Vocalization = vo.ID LEFT OUTER JOIN
                         lookup.WildlifeEvidencePresent AS ot ON wo.OtherEvidence = ot.ID
WHERE        (sv.VisitDate > CONVERT(DATETIME, '2018-11-04', 102))
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'    End
         Begin Table = "sc"
            Begin Extent = 
               Top = 516
               Left = 38
               Bottom = 629
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tr"
            Begin Extent = 
               Top = 516
               Left = 246
               Bottom = 629
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sh"
            Begin Extent = 
               Top = 630
               Left = 38
               Bottom = 743
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fo"
            Begin Extent = 
               Top = 630
               Left = 246
               Bottom = 743
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vo"
            Begin Extent = 
               Top = 744
               Left = 38
               Bottom = 857
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ot"
            Begin Extent = 
               Top = 744
               Left = 246
               Bottom = 857
               Right = 416
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
', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';


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
         Begin Table = "wa"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sv"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "iw"
            Begin Extent = 
               Top = 138
               Left = 273
               Bottom = 251
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dpl"
            Begin Extent = 
               Top = 252
               Left = 273
               Bottom = 382
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "wo"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "wt"
            Begin Extent = 
               Top = 384
               Left = 260
               Bottom = 514
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "do"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 515
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
     ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';

