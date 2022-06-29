
IF (EXISTS(
        SELECT TOP 1 1 FROM dbo.[FactInternetSales]))
            BEGIN
                TRUNCATE TABLE dbo.[FactInternetSales]
                INSERT INTO dbo.[FactInternetSales]
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
                    FROM local_test.dbo.[FactInternetSales]
            END
ELSE 
            BEGIN
                INSERT INTO dbo.[FactInternetSales]
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
                    FROM local_test.dbo.[FactInternetSales]
            END
