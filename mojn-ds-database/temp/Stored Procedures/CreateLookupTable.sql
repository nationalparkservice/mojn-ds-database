
-- =============================================
-- Author:		Simon Kingston
-- Create date: 8/25/2015
-- Update date: 9/01/2015 
--					- Simon Kingston: added extended properties for description for table and columns
-- Description:	Create a lookup table using the IMD Database Standards best practices v.1.0.
-- =============================================
CREATE PROCEDURE [temp].[CreateLookupTable] 
	-- Add the parameters for the stored procedure here
	@schemaName varchar(20) = 'lookup', 
	@tableName varchar(50),
	@includeDateCreated bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @sql varchar(MAX);
	DECLARE @errorMsg varchar(200);
	
	-- check to make sure the schema exists
	IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = @schemaName)
		BEGIN
			SET @errorMsg = 'The schema name you supplied does not exist in this database.';
			RAISERROR(@errorMsg,10,1);
			RETURN -1;
		END
		
-- check to make sure the table doesn't already exist in the specified schema
	IF EXISTS (
		SELECT 1 
		FROM sys.tables t
		INNER JOIN sys.schemas s ON s.schema_id = t.schema_id
		WHERE t.name = @tableName AND s.name = @schemaName)
		BEGIN
			SET @errorMsg = 'There is already a table named ' + @tableName + ' in the schema named ' + @schemaName + ' in this database.';
			RAISERROR(@errorMsg,10,1);
			RETURN -1;
		END
		SET @sql = 
		'CREATE TABLE [' + @schemaName + '].[' + @tableName + '](
			[ID] [tinyint] IDENTITY(1,1) NOT NULL,
			[Code] [varchar](5) NOT NULL CONSTRAINT UN_' + @tableName + '_Code UNIQUE,
			[Label] [varchar](20) NOT NULL CONSTRAINT UN_' + @tableName + '_Label UNIQUE,
			[Summary] varchar(200) NULL,
		 CONSTRAINT [PK_' + @tableName + '] PRIMARY KEY CLUSTERED 
		(
			[ID] ASC
		));
		ALTER TABLE [' + @schemaName + '].[' + @tableName + ']  ADD  CONSTRAINT [CK_' + @tableName + '_Code_DisallowZeroLength] CHECK  ((len([Code])>(0)));
		ALTER TABLE [' + @schemaName + '].[' + @tableName + ']  ADD  CONSTRAINT [CK_' + @tableName + '_Label_DisallowZeroLength] CHECK  ((len([Label])>(0)));
		ALTER TABLE [' + @schemaName + '].[' + @tableName + ']  ADD  CONSTRAINT [CK_' + @tableName + '_Summary_DisallowZeroLength] CHECK  ((len([Summary])>(0)));
		EXEC sp_addextendedproperty 
			@name = N''Description'', @value = ''Auto-incrementing integer primary key for ' + @tableName + ' values.'',
			@level0type = N''Schema'', @level0name = ''' + @schemaName + ''',
			@level1type = N''Table'', @level1name = ''' + @tableName + ''', 
			@level2type = N''Column'',@level2name = ''ID'';
		EXEC sp_addextendedproperty 
			@name = N''Description'', @value = ''Unique short identifier for ' + @tableName + ' values.'',
			@level0type = N''Schema'', @level0name = ''' + @schemaName + ''',
			@level1type = N''Table'', @level1name = ''' + @tableName + ''', 
			@level2type = N''Column'',@level2name = ''Code'';
		EXEC sp_addextendedproperty 
			@name = N''Description'', @value = ''Unique longer identifier for ' + @tableName + ' values.'',
			@level0type = N''Schema'', @level0name = ''' + @schemaName + ''',
			@level1type = N''Table'', @level1name = ''' + @tableName + ''', 
			@level2type = N''Column'',@level2name = ''Label'';
		EXEC sp_addextendedproperty 
			@name = N''Description'', @value = ''Longer description for ' + @tableName + ' values.'',
			@level0type = N''Schema'', @level0name = ''' + @schemaName + ''',
			@level1type = N''Table'', @level1name = ''' + @tableName + ''', 
			@level2type = N''Column'',@level2name = ''Summary''
		EXEC sp_addextendedproperty 
			@name = N''Description'', @value = ''Lookup domain values for  ' + @tableName + '.'',
			@level0type = N''Schema'', @level0name = ''' + @schemaName + ''',
			@level1type = N''Table'', @level1name = ''' + @tableName + ''';'
	IF @includeDateCreated = 1
		SET @sql = @sql + 
			'ALTER TABLE [' + @schemaName + '].[' + @tableName + '] ADD	[DateCreated] [datetime] NOT NULL;
		     ALTER TABLE [' + @schemaName + '].[' + @tableName + ']  ADD  CONSTRAINT DF_' + @tableName + '_DateCreated DEFAULT (getdate()) FOR [DateCreated]
		     EXEC sp_addextendedproperty 
				@name = N''Description'', @value = ''Date/time stamp for when ' + @tableName + ' values were added to the table.'',
				@level0type = N''Schema'', @level0name = ''' + @schemaName + ''',
				@level1type = N''Table'', @level1name = ''' + @tableName + ''', 
				@level2type = N''Column'',@level2name = ''DateCreated'';'
	EXEC (@sql);
END




GO
EXECUTE sp_addextendedproperty @name = N'Description', @value = N'Tool for creating a lookup table using the IMD Database Standards best practices v.1.0.', @level0type = N'SCHEMA', @level0name = N'temp', @level1type = N'PROCEDURE', @level1name = N'CreateLookupTable';

