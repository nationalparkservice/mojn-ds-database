
-- =============================================
-- Author:		<Sarah Wright>
-- Create date: <03/14/2018>
-- Description:	<Given a table name and a new table name, renames the table, keys, fk columns, constraints, and indexes>
-- =============================================
CREATE PROCEDURE [dbo].[renameTable]
(
	-- Add the parameters for the function here
	@OldTableName varchar(500),
	@OldTableSchema varchar(500),
	@NewTableName varchar(500),
	@NewTableSchema varchar(500)
)
AS
BEGIN
	-- Declare variables
	DECLARE @Success int;
	DECLARE @OldName varchar(500);
	DECLARE @NewName varchar(500);
	DECLARE @Cols table(sch varchar(20), tbl varchar(500), col varchar(500));
	DECLARE @Objs table(sch varchar(20), tbl varchar(500), obj varchar(500));
	DECLARE @Sch varchar(20);
	DECLARE @Tbl varchar(500);
	DECLARE @Col varchar(500);
	DECLARE @Obj varchar(500);
	DECLARE @NewObjName varchar(500);
	DECLARE @OldObjName varchar(500);
	DECLARE @OldColName varchar(500);
	DECLARE @NewColName varchar(500);

	SET @OldName = QUOTENAME(@OldTableSchema) + '.' + QUOTENAME(@OldTableName);
	SET @Success = 1;

	-- Check if table exists
	IF (EXISTS (SELECT * 
				FROM INFORMATION_SCHEMA.TABLES
				WHERE TABLE_SCHEMA = @OldTableSchema
				AND TABLE_NAME = @OldTableName))
	BEGIN
		-- Rename table
		EXEC sp_rename @OldName, @NewTableName;

		-- Rename FK columns in other tables
		INSERT INTO @Cols(sch, tbl, col)
			SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME
			FROM INFORMATION_SCHEMA.COLUMNS
			WHERE COLUMN_NAME LIKE @OldTableName + 'ID' AND TABLE_NAME NOT LIKE 'vw_%';

		WHILE (SELECT COUNT(1) FROM @Cols) > 0
		BEGIN
			SELECT TOP 1 @Sch = sch, @Tbl = tbl, @Col = col
			FROM @Cols
			ORDER BY col;
			DELETE FROM @Cols WHERE col = @Col AND tbl = @Tbl AND sch = @Sch;
			SET @OldColName = QUOTENAME(@Sch) + '.' + QUOTENAME(@Tbl) + '.' + QUOTENAME(@Col);
			SET @NewColName = @NewTableName + 'ID';
			EXEC sp_rename @OldColName, @NewColName, 'COLUMN';
		END

		-- Rename keys
		INSERT INTO @Objs(sch, obj)
			SELECT CONSTRAINT_SCHEMA, CONSTRAINT_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
			WHERE CONSTRAINT_NAME LIKE '%' + @OldTableName + '%';

		WHILE (SELECT COUNT(1) FROM @Objs) > 0
		BEGIN
			SELECT TOP 1 @Sch = sch, @Obj = obj
			FROM @Objs
			ORDER BY obj;
			DELETE FROM @Objs WHERE sch = @Sch AND obj = @Obj;
			SET @NewObjName = REPLACE(@Obj, @OldTableName, @NewTableName);
			SET @OldObjName = QUOTENAME(@Sch) + '.' + QUOTENAME(@Obj);
			EXEC sp_rename @OldObjName, @NewObjName, 'OBJECT';
		END
		

		-- Rename constraints
		INSERT INTO @Objs(sch, obj)
			SELECT CONSTRAINT_SCHEMA, CONSTRAINT_NAME FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS
			WHERE CONSTRAINT_NAME LIKE '%' + @OldTableName + '%'
			UNION 
			SELECT OBJECT_SCHEMA_NAME(object_id) AS CONSTRAINT_SCHEMA, name AS CONSTRAINT_NAME FROM sys.default_constraints
			WHERE name LIKE '%' + @OldTableName + '%';

		WHILE (SELECT COUNT(1) FROM @Objs) > 0
		BEGIN
			SELECT TOP 1 @Sch = sch, @Obj = obj
			FROM @Objs
			ORDER BY obj;
			DELETE FROM @Objs WHERE sch = @Sch AND obj = @Obj;
			SET @NewObjName = REPLACE(@Obj, @OldTableName, @NewTableName);
			SET @OldObjName = QUOTENAME(@Sch) + '.' + QUOTENAME(@Obj);
			EXEC sp_rename @OldObjName, @NewObjName, 'OBJECT';
		END

		-- Rename indexes
		INSERT INTO @Objs(sch, tbl, obj)
			SELECT OBJECT_SCHEMA_NAME(object_id) as sch, OBJECT_NAME(object_id) as tbl, name FROM sys.indexes
			WHERE name LIKE '%' + @OldTableName + '%' AND is_primary_key = 0;

		WHILE (SELECT COUNT(1) FROM @Objs) > 0
		BEGIN
			SELECT TOP 1 @Sch = sch, @Tbl =tbl, @Obj = obj
			FROM @Objs
			ORDER BY obj;
			DELETE FROM @Objs WHERE sch = @Sch AND tbl = @Tbl AND obj = @Obj;
			SET @NewObjName = REPLACE(@Obj, @OldTableName, @NewTableName);
			SET @OldObjName = QUOTENAME(@Sch) + '.' + QUOTENAME(@Tbl) + '.' + QUOTENAME(@Obj);
			EXEC sp_rename @OldObjName, @NewObjName, 'INDEX';
		END

	END

END



