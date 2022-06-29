/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

--:r .\checkConstraints.sql

:r .\dbo.Address.Table.Pre-Deployment.sql

:r .\dbo.Customer.Table.Pre-Deployment.sql

:r .\dbo.FactInternetSales.Table.Pre-Deployment.sql 

:r .\recreateConstraints.sql




