
IF (EXISTS(
        SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME='FK_Customer_Address'))
            BEGIN
                ALTER TABLE Customer DROP CONSTRAINT FK_Customer_Address
            END