

CREATE VIEW [app].[DatabaseVersion]
AS
SELECT        value
FROM            sys.extended_properties
WHERE        (name = 'DatabaseVersion') AND (class = 0)



