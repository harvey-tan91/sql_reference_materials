/*
1. The key difference between truncate and delete is that you can roll back a delete statement but and truncate cannot. 

2. If you truncate a table, the counters on any identity columns will be reset.

3. You can not truncate a table that is referenced by a foreign key.

*/


-- Deleting record in table
DELETE FROM EmployeesListing
WHERE EmployeeID = 1005 -- this is to indicate which record get deleted


-- Another way of deleting all records in table
TRUNCATE TABLE EmployeeListing


