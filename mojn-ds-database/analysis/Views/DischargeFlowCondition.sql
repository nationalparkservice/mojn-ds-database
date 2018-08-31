CREATE VIEW analysis.DischargeFlowCondition
AS
SELECT        P.Code AS ParkCode, S.Code AS SiteCode, S.Name AS SiteName, V.VisitDate, qa.Water_Year(V.VisitDate) AS VisitGroup, lookup.FlowCondition.Label AS FlowCondition, 
                         lookup.SpringbrookLengthFlag.Code AS SpringbrookLengthFlag, data.SpringbrookDimensions.SpringbrookLength_m, data.SpringbrookDimensions.SpringbrookWidth_m, lookup.VisitType.Label AS VisitType, 
                         DPL.Label AS DPL
FROM            lookup.SpringbrookLengthFlag INNER JOIN
                         data.SpringbrookDimensions ON lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID AND 
                         lookup.SpringbrookLengthFlag.ID = data.SpringbrookDimensions.SpringbrookLengthFlagID RIGHT OUTER JOIN
                         data.DischargeActivity INNER JOIN
                         data.Site AS S LEFT OUTER JOIN
                         data.Visit AS V ON S.ID = V.SiteID INNER JOIN
                         lookup.Park AS P ON S.ParkID = P.ID INNER JOIN
                         lookup.ProtectedStatus ON S.ProtectedStatusID = lookup.ProtectedStatus.ID INNER JOIN
                         lookup.VisitType ON V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID AND 
                         V.VisitTypeID = lookup.VisitType.ID AND V.VisitTypeID = lookup.VisitType.ID INNER JOIN
                         lookup.MonitoringStatus ON V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND 
                         V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID AND V.MonitoringStatusID = lookup.MonitoringStatus.ID ON 
                         data.DischargeActivity.VisitID = V.ID INNER JOIN
                         lookup.FlowCondition ON data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND 
                         data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID AND data.DischargeActivity.FlowConditionID = lookup.FlowCondition.ID ON 
                         data.SpringbrookDimensions.DischargeActivityID = data.DischargeActivity.ID LEFT OUTER JOIN
                         lookup.DataProcessingLevel AS DPL ON data.DischargeActivity.DataProcessingLevelID = DPL.ID AND data.DischargeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.DischargeActivity.DataProcessingLevelID = DPL.ID AND data.DischargeActivity.DataProcessingLevelID = DPL.ID AND data.DischargeActivity.DataProcessingLevelID = DPL.ID AND 
                         data.DischargeActivity.DataProcessingLevelID = DPL.ID AND data.DischargeActivity.DataProcessingLevelID = DPL.ID LEFT OUTER JOIN
                         lookup.Subunit ON S.SubunitID = lookup.Subunit.ID
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 2, @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DischargeFlowCondition';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane2', @value = N'       End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FlowCondition (lookup)"
            Begin Extent = 
               Top = 157
               Left = 761
               Bottom = 289
               Right = 931
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DPL"
            Begin Extent = 
               Top = 301
               Left = 428
               Bottom = 431
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Subunit (lookup)"
            Begin Extent = 
               Top = 158
               Left = 0
               Bottom = 288
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SpringbrookDimensions (data)"
            Begin Extent = 
               Top = 62
               Left = 812
               Bottom = 192
               Right = 1036
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "SpringbrookLengthFlag (lookup)"
            Begin Extent = 
               Top = 252
               Left = 707
               Bottom = 382
               Right = 877
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
      Begin ColumnWidths = 11
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
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
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
         Begin Table = "DischargeActivity (data)"
            Begin Extent = 
               Top = 164
               Left = 418
               Bottom = 294
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 4
         End
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
               Top = 292
               Left = 0
               Bottom = 422
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VisitType (lookup)"
            Begin Extent = 
               Top = 152
               Left = 195
               Bottom = 282
               Right = 365
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "MonitoringStatus (lookup)"
            Begin Extent = 
               Top = 290
               Left = 198
               Bottom = 420
               Right = 368
     ', @level0type = N'SCHEMA', @level0name = N'analysis', @level1type = N'VIEW', @level1name = N'DischargeFlowCondition';

