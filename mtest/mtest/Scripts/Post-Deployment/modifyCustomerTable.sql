
IF (EXISTS(
		SELECT 1 
		FROM INFORMATION_SCHEMA.TABLES 
		WHERE TABLE_NAME='Customer' AND TABLE_SCHEMA='tmp'))
            
            BEGIN
				IF (EXISTS(
                    SELECT TOP 1 1 FROM dbo.[Customer]))
                        BEGIN
                            TRUNCATE TABLE dbo.[Customer]
                            INSERT INTO dbo.[Customer]([ID], [Name], [AddressID], [Gender])
	                            SELECT [ID], [Name], [AddressID], 0 as Gender FROM tmp.[Customer]
                        END
                ELSE 
                        BEGIN
                            INSERT INTO dbo.[Customer]([ID], [Name], [AddressID], [Gender])
	                            SELECT [ID], [Name], [AddressID], 0 as Gender FROM tmp.[Customer]
                        END
            END


