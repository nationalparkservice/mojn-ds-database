CREATE VIEW [ref].[SensorAllActivity]
AS
SELECT        Sensor.Label AS SensorNumber, data.Visit.VisitDate, Location.Name AS SpringName, Location.Code AS SpringCode, NULL AS SensorRetrieved, NULL AS SensorProblem, Sensor.ID AS SensorID, data.Visit.ID AS VisitID
FROM            ref.Sensor AS Sensor LEFT OUTER JOIN
                         data.SensorDeployment AS Deployment ON Deployment.SensorID = Sensor.ID LEFT OUTER JOIN
                         data.Visit ON data.Visit.ID = Deployment.VisitID LEFT OUTER JOIN
                         data.Site AS Location ON data.Visit.SiteID = Location.ID
UNION
SELECT        ref.Sensor.Label AS SensorNumber, data.Visit.VisitDate, data.Site.Name AS SpringName, data.Site.Code AS SpringCode, lookup.IsSensorRetrieved.Code AS SensorRetrieved, lookup.SensorProblem.Label AS SensorProblem, 
                         ref.Sensor.ID AS SensorID, data.Visit.ID AS VisitID
FROM            data.SensorRetrievalAttempt INNER JOIN
                         data.Visit ON data.SensorRetrievalAttempt.VisitID = data.Visit.ID AND data.SensorRetrievalAttempt.VisitID = data.Visit.ID INNER JOIN
                         data.Site ON data.Visit.SiteID = data.Site.ID AND data.Visit.SiteID = data.Site.ID INNER JOIN
                         data.SensorDeployment ON data.SensorRetrievalAttempt.SensorDeploymentID = data.SensorDeployment.ID AND data.SensorRetrievalAttempt.SensorDeploymentID = data.SensorDeployment.ID INNER JOIN
                         ref.Sensor ON data.SensorDeployment.SensorID = ref.Sensor.ID INNER JOIN
                         lookup.IsSensorRetrieved ON data.SensorRetrievalAttempt.IsSensorRetrievedID = lookup.IsSensorRetrieved.ID AND data.SensorRetrievalAttempt.IsSensorRetrievedID = lookup.IsSensorRetrieved.ID INNER JOIN
                         lookup.SensorProblem ON data.SensorRetrievalAttempt.SensorProblemID = lookup.SensorProblem.ID AND data.SensorRetrievalAttempt.SensorProblemID = lookup.SensorProblem.ID



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'View Sensor All Activity', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'VIEW', @level1name = N'SensorAllActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[13] 4[12] 2[28] 3) )"
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
', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'VIEW', @level1name = N'SensorAllActivity';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'VIEW', @level1name = N'SensorAllActivity';

