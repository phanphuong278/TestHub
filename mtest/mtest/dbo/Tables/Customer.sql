CREATE TABLE [dbo].[Customer] (
    [ID]        INT            NULL,
    [Name]      NVARCHAR (MAX) NULL,
    [AddressID] INT            NULL,
    CONSTRAINT [FK_Customer_Address] FOREIGN KEY ([AddressID]) REFERENCES [dbo].[Address] ([ID])
);

