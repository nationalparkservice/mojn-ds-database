CREATE VIEW ref.SensorToDeploymentIDCrosswalk
AS
SELECT        sd.ID AS DeploymentID, s.Label AS SensorLabel, dv.VisitDate AS DeploymentDate, dv.SiteID AS DeploymentSiteID, st.Code AS DeploymentSiteCode, sd.SensorID AS SensorID, sr.ID AS RetrievalAttemptID, 
                         ret.Code AS SensorRetrievedCode
FROM            ref.Sensor AS s INNER JOIN
                         data.SensorDeployment AS sd ON sd.SensorID = s.ID INNER JOIN
                         data.Visit AS dv ON sd.VisitID = dv.ID INNER JOIN
                         data.SensorRetrievalAttempt AS sr ON sr.SensorDeploymentID = sd.ID LEFT JOIN
                         lookup.IsSensorRetrieved AS ret ON sr.IsSensorRetrievedID = ret.ID LEFT JOIN
                         data.Site AS st ON dv.SiteID = st.ID
WHERE        ret.Code <> 'Y'
UNION
SELECT        sd.ID AS DeploymentID, s.Label AS SensorLabel, dv.VisitDate AS DeploymentDate, dv.SiteID AS DeploymentSiteID, st.Code AS DeploymentSiteCode, sd.SensorID AS SensorID, sr.ID AS RetrievalAttemptID, 
                         'NA' AS SensorRetrievedCode
FROM            ref.Sensor AS s LEFT JOIN
                         data.SensorDeployment AS sd ON sd.SensorID = s.ID INNER JOIN
                         data.Visit AS dv ON sd.VisitID = dv.ID LEFT JOIN
                         data.SensorRetrievalAttempt AS sr ON sr.SensorDeploymentID = sd.ID LEFT JOIN
                         data.Site AS ds ON dv.SiteID = ds.ID LEFT JOIN
                         data.Site AS st ON dv.SiteID = st.ID
WHERE        sr.ID IS NULL
GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'VIEW', @level1name = N'SensorToDeploymentIDCrosswalk';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[20] 4[16] 2[23] 3) )"
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
         Width = 2625
         Width = 2145
         Width = 1935
         Width = 2310
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2205
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
', @level0type = N'SCHEMA', @level0name = N'ref', @level1type = N'VIEW', @level1name = N'SensorToDeploymentIDCrosswalk';

