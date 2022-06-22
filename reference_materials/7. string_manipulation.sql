
/*
For full list, see: https://www.w3schools.com/sql/sql_ref_sqlserver.asp
*/

-- UPPER return value with upper case
-- LOWER return value with upper case
SELECT UPPER(FirstName), LOWER(LastName) FROM EmployeeListing


-- CONCAT join values 
SELECT CONCAT(FirstName, ' ', LastName) FROM EmployeeListing


-- This replaces all values in FirstName with value 'Jim' to 'James'
SELECT REPLACE(FirstName, 'Jim', 'James') FROM EmployeeListing


-- Extract 5 characters from a string, starting in position 2
SELECT SUBSTRING(LastName,2,5), LastName FROM EmployeeListing


-- Extract 2 characters from the left
SELECT LEFT(FirstName,2) FROM EmployeeListing


-- Extract 2 characters from the right
SELECT RIGHT(FirstName,2) FROM EmployeeListing


-- Return the len of the string
SELECT LEN(FirstName) FROM EmployeeListing


-- Return the reverse values
SELECT REVERSE(FirstName) FROM EmployeeListing
