-- Adding new columns into table
ALTER TABLE EmployeeListing
ADD EmployeeAddress VARCHAR(255) DEFAULT 'JAPAN'


-- Dropping existing columns table
ALTER TABLE EmployeeListing
DROP COLUMN EmployeeAddress


-- Changing the data type of a column
ALTER TABLE EmployeeListing
ALTER COLUMN EmployeeAddress TEXT -- Define the new column type here 


-- Defining the primary key when the table is already created
ALTER TABLE EmployeeListing
ADD PRIMARY KEY (EmployeeID)


-- Defining the foreign key when the table is already created
ALTER TABLE EmployeeListing
ADD FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)


-- Altering the constraint of a column to be NOT NULL
ALTER TABLE EmployeeListing
ALTER COLUMN EmployeeAddress INT NOT NULL


-- Adding a single constraint when the table is already created
ALTER TABLE OrderListing
ADD check (Age > 18) 


-- Adding a multiple constraint when the table is already created
ALTER TABLE OrderListing
ADD CONSTRAINT age_gen_con CHECK (Age > 18 AND GENDER IN ('Male' , 'Female') ) 


-- Adding a single constraint when the table is already created
ALTER TABLE OrderListing
DROP CONSTRAINT name_of_constraint







