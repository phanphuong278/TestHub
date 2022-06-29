
IF (NOT EXISTS(
		SELECT 1
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE 
			 TABLE_SCHEMA = 'dbo' AND
			 TABLE_NAME   = 'Address' AND 
			 COLUMN_NAME  = 'Gender'))

			BEGIN
				IF (EXISTS(
						SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Customer' AND TABLE_SCHEMA='dbo'))
							BEGIN
								IF (EXISTS(
										SELECT TOP 1 1 FROM dbo.[Customer]))
											BEGIN
												IF (NOT EXISTS(
														SELECT 1 
														FROM INFORMATION_SCHEMA.TABLES 
														WHERE TABLE_NAME='Customer' AND TABLE_SCHEMA='tmp'))
															BEGIN
																CREATE TABLE [tmp].[Customer]
																(
																	ID int,
																	[Name] nvarchar(max),
																	[AddressID] int
																)
															END

												TRUNCATE TABLE [tmp].[Customer] 

												INSERT INTO [tmp].[Customer]
													SELECT [ID], [Name], [AddressID] FROM dbo.[Customer]

												TRUNCATE TABLE dbo.[Customer]
											END
							END
			END


