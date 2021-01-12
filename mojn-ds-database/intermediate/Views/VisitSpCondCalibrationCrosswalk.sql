CREATE VIEW intermediate.VisitSpCondCalibrationCrosswalk
AS
SELECT DISTINCT all_cal.VisitID,
                all_cal.CalibrationID
FROM
  (SELECT sv.VisitID,
          cal.ID AS CalibrationID,
          CAST(CONVERT(DATE, cal.CalibrationDate) AS datetime) + CAST(CONVERT(TIME, cal.CalibrationTime) AS datetime) AS CalibrationDateTime
   FROM intermediate.SiteVisit AS sv
   INNER JOIN data.WaterQualityActivity AS wq ON wq.VisitID = sv.VisitID
   INNER JOIN lookup.WaterQualityDataCollected AS wqc ON wq.WaterQualityDataCollectedID = wqc.ID
   INNER JOIN data.CalibrationSpCond_Shared AS cal ON wq.SpCondInstrumentID = cal.SpCondInstrumentID) AS all_cal
INNER JOIN
  (SELECT sv.VisitID,
          MAX(CAST(CONVERT(DATE, cal.CalibrationDate) AS datetime) + CAST(CONVERT(TIME, cal.CalibrationTime) AS datetime)) AS CalibrationDateTime
   FROM intermediate.SiteVisit AS sv
   INNER JOIN data.WaterQualityActivity AS wq ON wq.VisitID = sv.VisitID
   INNER JOIN lookup.WaterQualityDataCollected AS wqc ON wq.WaterQualityDataCollectedID = wqc.ID
   INNER JOIN data.CalibrationSpCond_Shared AS cal ON wq.SpCondInstrumentID = cal.SpCondInstrumentID
   AND CAST(CONVERT(DATE, sv.VisitDate) AS datetime) + IIF(NOT sv.StartTime IS NULL, CAST(CONVERT(TIME, sv.StartTime) AS datetime), CAST('' AS datetime)) >= CAST(CONVERT(DATE, cal.CalibrationDate) AS datetime) + IIF(cal.CalibrationTime IS NULL, CAST('' AS datetime), CAST(CONVERT(TIME, cal.CalibrationTime) AS datetime))
   WHERE (wqc.Code = 'Y')
   GROUP BY sv.VisitID,
            sv.VisitDate,
            sv.StartTime) AS latest_cal ON all_cal.VisitID = latest_cal.VisitID
AND all_cal.CalibrationDateTime = latest_cal.CalibrationDateTime
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'VisitSpCondCalibrationCrosswalk';


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
         Begin Table = "all_cal"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 238
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "latest_cal"
            Begin Extent = 
               Top = 6
               Left = 276
               Bottom = 102
               Right = 474
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
', @level0type = N'SCHEMA', @level0name = N'intermediate', @level1type = N'VIEW', @level1name = N'VisitSpCondCalibrationCrosswalk';

