
DECLARE @len int;

SELECT @len=COL_LENGTH('dbo.Address','Name')

IF (@len<>40)
	BEGIN
		IF (EXISTS(
				SELECT TOP 1 1 
				FROM INFORMATION_SCHEMA.TABLES 
				WHERE TABLE_NAME='Address' AND TABLE_SCHEMA='dbo'))
					BEGIN 
						IF (EXISTS(
								SELECT TOP 1 1 FROM dbo.[Address]))
									BEGIN
										IF (NOT EXISTS(
												SELECT 1 
												FROM INFORMATION_SCHEMA.TABLES 
												WHERE TABLE_NAME='Address' AND TABLE_SCHEMA='tmp'))
													BEGIN
														CREATE TABLE [tmp].[Address]
														(
																ID int PRIMARY KEY,
																[Name] nvarchar(max)
														)
													END

										TRUNCATE TABLE [tmp].[Address]

										INSERT INTO [tmp].[Address]
											SELECT [ID], [Name] FROM dbo.[Address]

										TRUNCATE TABLE dbo.[Address]
									END
					END
	END



