CREATE VIEW [lookup].[ProtectedStatus_Shared]
	AS SELECT * FROM [$(mojnSharedTables)].[lookup].[ProtectedStatus]
