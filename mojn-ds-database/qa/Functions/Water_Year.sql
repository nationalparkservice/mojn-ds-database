-- =============================================
-- Author:		<Sarah Wright>
-- Create date: <3/28/2016>
-- Description:	<Given a date, computes the hydrologic year.>
-- =============================================
CREATE FUNCTION [qa].[Water_Year] (@Date datetime2)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @HY int;

	-- Add the T-SQL statements to compute the return value here
	SELECT @HY = DATEPART(YYYY, @Date)
	IF DATEPART(MM, @Date) >= 10
		SELECT @HY = @HY + 1;

	-- Return the result of the function
	RETURN @HY;

END



