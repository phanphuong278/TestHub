
IF (EXISTS(
        SELECT TOP 1 1 FROM dbo.[Customer]))
            BEGIN
                TRUNCATE TABLE dbo.[Customer]
                INSERT INTO dbo.[Customer]
                    SELECT [ID], [Name], [AddressID] FROM local_test.dbo.[Customer]
            END
ELSE 
            BEGIN
                INSERT INTO dbo.[Customer]
                    SELECT [ID], [Name], [AddressID] FROM local_test.dbo.[Customer]
            END
