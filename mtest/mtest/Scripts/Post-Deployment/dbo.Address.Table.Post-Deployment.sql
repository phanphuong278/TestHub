
IF (EXISTS(
        SELECT TOP 1 1 FROM dbo.[Address]))
            BEGIN
                TRUNCATE TABLE dbo.[Address]
                INSERT INTO dbo.[Address]
                    SELECT [ID], [Name] FROM local_test.dbo.[Address]
            END
ELSE 
            BEGIN
                INSERT INTO dbo.[Address]
                    SELECT [ID], [Name] FROM local_test.dbo.[Address]
            END
