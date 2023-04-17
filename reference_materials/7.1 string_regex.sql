/*
-- Not case sensitive 
-- The percent sign (%) represents zero, one, or multiple characters
-- The underscore sign (_) represents one, single character

For reference, see: https://www.w3schools.com/sql/sql_like.asp
*/


-- Return all values where FirstName starts with M/m
SELECT * FROM EmployeeListing
WHERE FirstName LIKE 'm%'


-- Return all values where the second character of FirstName is i 
SELECT * FROM EmployeeListing
WHERE FirstName LIKE '_i%'