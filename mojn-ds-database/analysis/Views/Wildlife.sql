CREATE VIEW analysis.Wildlife
AS
SELECT        P.Code AS ParkCode, S.Code AS SiteCode, S.Name AS SiteName, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, lookup.WildlifeType.Code AS Type, data.WildlifeObservation.SpeciesName, 
                         lookup.WildlifeEvidence.Label AS Evidence, lookup.VisitType.Label AS VisitType, DPL.Label AS DPL
FROM            data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID INNER JOIN
                         lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND 
                         V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID INNER JOIN
                         lookup.MonitoringStatus ON V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND 
                         V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID INNER JOIN
                         data.WildlifeActivity ON V.ID = data.WildlifeActivity.VisitID INNER JOIN
                         data.WildlifeObservation ON data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND 
                         data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND 
                         data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID AND 
                         data.WildlifeActivity.ID = data.WildlifeObservation.WildlifeActivityID INNER JOIN
                         lookup.WildlifeEvidence ON data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND 
                         data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID AND data.WildlifeObservation.WildlifeEvidenceID = lookup.WildlifeEvidence.ID INNER JOIN
                         lookup.WildlifeType ON data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND 
                         data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND
                          data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND 
                         data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID AND 
                         data.WildlifeObservation.WildlifeTypeID = lookup.WildlifeType.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND data.WildlifeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.WildlifeActivity.DataProcessingLevelID = DPL.ID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'      End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "WildlifeObservation (data)"
            Begin Extent = 
               Top = 183
               Left = 641
               Bottom = 343
               Right = 857
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "WildlifeEvidence (lookup)"
            Begin Extent = 
               Top = 355
               Left = 689
               Bottom = 468
               Right = 859
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WildlifeType (lookup)"
            Begin Extent = 
               Top = 349
               Left = 442
               Bottom = 479
               Right = 612
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 305
               Left = 234
               Bottom = 435
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
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
      Begin ColumnWidths = 14
         Width = 284
         Width = 945
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1050
         Width = 1065
         Width = 2385
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
         Column = 1665
         Alias = 1455
         Table = 2175
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
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 169
               Left = 232
               Bottom = 299
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MonitoringStatus (lookup)"
            Begin Extent = 
               Top = 44
               Left = 792
               Bottom = 174
               Right = 962
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "WildlifeActivity (data)"
            Begin Extent = 
               Top = 167
               Left = 450
               Bottom = 333
               Right = 616
      ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'Wildlife';

