
IF (EXISTS(
		SELECT 1 
		FROM INFORMATION_SCHEMA.TABLES 
		WHERE TABLE_NAME='FactInternetSales' AND TABLE_SCHEMA='tmp'))

			BEGIN
				IF (EXISTS(
						SELECT TOP 1 1 FROM dbo.[FactInternetSales]))
							BEGIN
								TRUNCATE TABLE dbo.[FactInternetSales]
								INSERT INTO dbo.[FactInternetSales]
									SELECT 
										ProductKey,
										OrderDateKey,
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
									FROM tmp.[FactInternetSales]
							END
				ELSE 
							BEGIN
								INSERT INTO dbo.[FactInternetSales]
									SELECT 
										ProductKey,
										OrderDateKey,
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
									FROM tmp.[FactInternetSales]
							END
			END


