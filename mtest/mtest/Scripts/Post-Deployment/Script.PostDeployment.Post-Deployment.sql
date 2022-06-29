/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/


:r .\checkConstraints.sql

:r .\dbo.Address.Table.Post-Deployment.sql

:r .\dbo.Customer.Table.Post-Deployment.sql

:r .\dbo.FactInternetSales.Table.Post-Deployment.sql

--:r .\modifyAddressTable.sql

--:r .\modifyCustomerTable.sql

--:r .\modifyFactInternetSalesTable.sql

:r .\dropTempTables.sql

:r .\recreateConstraints.sql



