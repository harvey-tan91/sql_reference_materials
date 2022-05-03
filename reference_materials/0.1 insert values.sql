-- Inserting records into table where all columns have a record
INSERT INTO EmployeesListing VALUES
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male')


-- Inserting into specific columns
INSERT INTO 
    EmployeeListing(EmployeeID, FirstName)
VALUES
    ('1014', 'TEST')
