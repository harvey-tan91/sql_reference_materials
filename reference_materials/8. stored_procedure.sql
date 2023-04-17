USE name_of_database

GO -- begins a new batch
-- Creating a stored procedure named 'my_sp'
CREATE PROCEDURE my_sp -- Create procedure keywords need to be the first in the batch, use the keyword GO
AS
BEGIN
    INSERT INTO EmployeeListing(FirstName, LastName) 
    VALUES
    ('Harry', 'Potter')
END

-- Execute stored procedure named 'my_sp'
EXEC my_sp 


-- Dropping/deleting stored procedure named 'my_sp' 
DROP PROCEDURE my_sp

GO
-- Alter a stored procedure
ALTER PROCEDURE my_sp
AS
BEGIN
    INSERT INTO EmployeeListing(FirstName, LastName) 
    VALUES
    ('Harry', 'Potter')
END





