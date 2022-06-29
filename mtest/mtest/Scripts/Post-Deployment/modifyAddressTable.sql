

IF (EXISTS(
        SELECT 1 
		FROM INFORMATION_SCHEMA.TABLES 
		WHERE TABLE_NAME='Address' AND TABLE_SCHEMA='tmp'))
            
            BEGIN
                IF (EXISTS(
                    SELECT TOP 1 1 FROM dbo.[Address]))
                        BEGIN
                            TRUNCATE TABLE dbo.[Address]
                            INSERT INTO dbo.[Address]
	                            SELECT [ID], [Name] FROM tmp.[Address]
                        END
                ELSE 
                        BEGIN
                            INSERT INTO dbo.[Address]
                                SELECT [ID], [Name] FROM tmp.[Address]
                        END
            END

