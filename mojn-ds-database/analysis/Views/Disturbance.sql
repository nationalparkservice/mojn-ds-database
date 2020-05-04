CREATE VIEW analysis.Disturbance
AS
SELECT        sv.Park, sv.SiteCode, sv.SiteName, sv.VisitDate, sv.FieldSeason, rd.Code AS Roads, hu.Code AS HumanUse, pm.Code AS PlantManagement, ht.Code AS HikingTrails, li.Code AS Livestock, oa.Code AS OtherAnthropogenic, 
                         fi.Code AS Fire, fl.Code AS Flooding, wi.Code AS Wildlife, ot.Code AS OtherNatural, ov.Code AS Overall, fm.Label AS FlowModificationStatus, sv.VisitType, dpl.Label AS DPL
FROM            data.DisturbanceActivity AS da INNER JOIN
                         intermediate.SiteVisit AS sv ON da.VisitID = sv.VisitID LEFT OUTER JOIN
                         lookup.FlowModificationStatus AS fm ON da.FlowModificationStatusID = fm.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS dpl ON da.DataProcessingLevelID = dpl.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS rd ON da.Roads = rd.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS hu ON da.HumanUse = hu.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS pm ON da.PlantManagement = pm.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS ht ON da.HikingTrails = ht.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS li ON da.Livestock = li.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS oa ON da.OtherAnthropogenic = oa.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS fi ON da.Fire = fi.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS fl ON da.Flooding = fl.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS wi ON da.Wildlife = wi.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS ot ON da.OtherNatural = ot.ID LEFT OUTER JOIN
                         lookup.DisturbanceClass AS ov ON da.Overall = ov.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Disturbance';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'    End
         Begin Table = "ht"
            Begin Extent = 
               Top = 498
               Left = 38
               Bottom = 611
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "li"
            Begin Extent = 
               Top = 498
               Left = 246
               Bottom = 611
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oa"
            Begin Extent = 
               Top = 612
               Left = 38
               Bottom = 725
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fi"
            Begin Extent = 
               Top = 612
               Left = 246
               Bottom = 725
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fl"
            Begin Extent = 
               Top = 726
               Left = 38
               Bottom = 839
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "wi"
            Begin Extent = 
               Top = 726
               Left = 246
               Bottom = 839
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ot"
            Begin Extent = 
               Top = 840
               Left = 38
               Bottom = 953
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ov"
            Begin Extent = 
               Top = 840
               Left = 246
               Bottom = 953
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
         Begin Table = "da"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 263
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
         Begin Table = "fm"
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
         Begin Table = "rd"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 383
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hu"
            Begin Extent = 
               Top = 384
               Left = 38
               Bottom = 497
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pm"
            Begin Extent = 
               Top = 384
               Left = 246
               Bottom = 497
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
     ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Disturbance';

