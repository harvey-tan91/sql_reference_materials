/*
- A primary key is a field in a table which uniquely identifies each row/record in a database table. 
- Primary keys must contain unique values. 
- A primary key column cannot have NULL values.
- A table can have only one primary key. 
*/

-- Create table
CREATE Table OrderListing -- name of the table
(
OrderID INT PRIMARY KEY IDENTITY(1, 1), -- IDENTITY will auto-increase by 1 when new records are inserted and starts at 1 
CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID), -- This creates a foreign key which reference to the primary key in the Customer table
FirstName VARCHAR(50) NOT NULL, -- This creates a constraint that an insertion cannot have null values for this column
LastName VARCHAR(50) UNIQUE, -- You can have multiple unique constraint but only one primary key
Age INT DEFAULT 0, -- Setting a default value
Gender VARCHAR(50) CHECK ( Gender IN ('Male' , 'Female') ), -- This creates a constraint on the input values
TimeInserted DATETIME DEFAULT CURRENT_TIMESTAMP -- This creates a timestamp when a new record is inserted

CONSTRAINT age_gen_con CHECK (Age > 18 AND Gender IN ('Male' , 'Female') ) -- This creates a constraint on multiple columns / conditions
)


-- Drop table if table exists and create table 
DROP TABLE IF EXISTS OrderListing -- this delete table exists
CREATE TABLE OrderListing
(
JobTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT
)

