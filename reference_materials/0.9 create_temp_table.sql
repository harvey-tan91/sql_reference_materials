/*
-- Temporary tables are used to store data temporarily and they can perform CRUD, join, and some other operations like the persistent database tables. 
-- Temporary tables are dropped when the session that creates the table has closed, or can also be explicitly dropped by users. 
-- At the same time, temporary tables can act like physical tables in many ways, which gives us more flexibility. Such as, we can create constraints, indexes, or statistics in these tables. 
-- The local temporary tables are created in the tempdb database
-- Temp tables are often used in stored procedure

Two types of temp tables:
-- Local temp table - the temp tables can only be used in the local session
-- Global temp table - the temp tables can be used by all other session
*/


-- the pound sign # will indicate the creation of a local temp table
CREATE TABLE #temp_employee
(
EmployeeID INT,
FirstName VARCHAR(255),
Age INT
)


-- the DOUBLE pound sign ## will indicate the creation of a global temp table
CREATE TABLE ##temp_employee
(
EmployeeID INT,
FirstName VARCHAR(255),
Age INT
)

