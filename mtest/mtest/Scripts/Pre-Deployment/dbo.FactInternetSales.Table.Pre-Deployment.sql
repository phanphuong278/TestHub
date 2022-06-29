
IF (EXISTS(
		SELECT 1
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE 
			 TABLE_SCHEMA = 'dbo' AND
			 TABLE_NAME   = 'FactInternetSales' AND 
			 COLUMN_NAME  = 'DueDateKey'))

			 BEGIN
				IF (EXISTS(
						SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='FactInternetSales' AND TABLE_SCHEMA='dbo'))
							BEGIN
								IF (EXISTS(
										SELECT TOP 1 1 FROM dbo.[FactInternetSales]))
											BEGIN
												IF (NOT EXISTS(
													SELECT 1 
													FROM INFORMATION_SCHEMA.TABLES 
													WHERE TABLE_NAME='FactInternetSales' AND TABLE_SCHEMA='tmp'))
														BEGIN
															CREATE TABLE [tmp].[FactInternetSales]
															(
																[ProductKey] [int] NOT NULL,
																[OrderDateKey] [int] NOT NULL,
																[DueDateKey] [int] NOT NULL,
																[ShipDateKey] [int] NOT NULL,
																[CustomerKey] [int] NOT NULL,
																[PromotionKey] [int] NOT NULL,
																[CurrencyKey] [int] NOT NULL,
																[SalesTerritoryKey] [int] NOT NULL,
																[SalesOrderNumber] [nvarchar](20) NOT NULL,
																[SalesOrderLineNumber] [tinyint] NOT NULL,
																[RevisionNumber] [tinyint] NOT NULL,
																[OrderQuantity] [smallint] NOT NULL,
																[UnitPrice] [money] NOT NULL,
																[ExtendedAmount] [money] NOT NULL,
																[UnitPriceDiscountPct] [float] NOT NULL,
																[DiscountAmount] [float] NOT NULL,
																[ProductStandardCost] [money] NOT NULL,
																[TotalProductCost] [money] NOT NULL,
																[SalesAmount] [money] NOT NULL,
																[TaxAmt] [money] NOT NULL,
																[Freight] [money] NOT NULL,
																[CarrierTrackingNumber] [nvarchar](25) NULL,
																[CustomerPONumber] [nvarchar](25) NULL,
																[OrderDate] [datetime] NULL,
																[DueDate] [datetime] NULL,
																[ShipDate] [datetime] NULL
															)
														END

												TRUNCATE TABLE [tmp].[FactInternetSales]

												INSERT INTO [tmp].[FactInternetSales]
													SELECT 
														ProductKey,
														OrderDateKey,
														DueDateKey,
														ShipDateKey,
														CustomerKey,
														PromotionKey,
														CurrencyKey,
														SalesTerritoryKey,
														SalesOrderNumber,
														SalesOrderLineNumber,
														RevisionNumber,
														OrderQuantity,
														UnitPrice,
														ExtendedAmount,
														UnitPriceDiscountPct,
														DiscountAmount,
														ProductStandardCost,
														TotalProductCost,
														SalesAmount,
														TaxAmt,
														Freight,
														CarrierTrackingNumber,
														CustomerPONumber,
														OrderDate,
														DueDate,
														ShipDate
													FROM dbo.[FactInternetSales]

												TRUNCATE TABLE [dbo].[FactInternetSales]
											END
							END
			 END

