-------------------------------------------------
---- Creating Tables and Inserting/Updating Info----

-- Create Table
CREATE Table EmployeesListing
(
    EmployeeID INT PRIMARY KEY IDENTITY(1,1), -- IDENTITY will auto-increase by 1 when new records are inserted
    FirstName VARCHAR(50) NOT NULL, -- This creates a constraint that an insertion cannot have null values for this column
    LastName VARCHAR(50),
    Age INT DEFAULT 0, -- Setting a default value
    Gender VARCHAR(50) CHECK ( Gender IN ('Male' , 'Female') ), -- This creates a constraint on the input values
    TimeInserted DATETIME DEFAULT CURRENT_TIMESTAMP -- This creates a timestamp when a new record is inserted

    CONSTRAINT age_gen_con CHECK (Age > 18 AND GENDER IN ('Male' , 'Female') ) -- This creates a constraint on multiple columns / conditions
)
--

-- Create Temp Table
DROP TABLE IF EXISTS #Temp_Employee2 -- this delete existing temp table if any
CREATE TABLE #Temp_Employee2
(
JobTitle VARCHAR(50),
EmployeesPerJob INT,
AvgAge INT,
AvgSalary INT
)
--

-- Inserting records into table
INSERT INTO EmployeesListing VALUES
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male')
--

-- Inserting into specific columns
INSERT INTO 
    EmployeeListing(EmployeeID, FirstName)
VALUES
    ('1014', 'TEST')
--

-- Adding new columns
ALTER TABLE EmployeeListing
ADD EmployeeAddress VARCHAR(255)

-- Dropping existing columns
ALTER TABLE EmployeeListing
DROP COLUMN EmployeeAddress

-- Updating data in table
UPDATE EmployeesListing
SET 
    -- this is where we specify the values that we want to update
    EmployeeID = 1012, 
    Age = 31, 
    Gender = 'Female' 
WHERE
    FirstName = 'Holly' AND 
    LastName = 'Flax'
 
-- Deleting record in table
DELETE FROM EmployeesListing
WHERE EmployeeID = 1005
-- 

---- Creating Stored Procedures ----
GO
CREATE PROCEDURE name_of_my_sp
AS
SELECT * FROM tableA


---- Creating and Altering View ----
/* 
1. Views always stay up to date
2. Updatable views cannot include
--- Aggregate functions
--- Group By
--- Having
--- UNION
--- DISTINCT
--- {LEFT JOIN, RIGHT JOIN, OUTER JOIN}
--- SUBQUERIES
*/

--
GO
CREATE VIEW sample_view_name AS
SELECT * FROM tableA
    WHERE col_name_A > '1 Jan 2021'
GO
-- 

--
GO
ALTER VIEW sample_view_name AS
SELECT * FROM tableA
    WHERE col_name_A > '1 June 2021'
GO
--

---- Common Table Expression --- 
/*
1. A CTE is a temporary result set that we reference within another SELECT, INSERT, UPDATE or DELETE statement
2. A CTE always return a result set
*/
-- Create single CTE
WITH tableA_CTE (new_col_A_name, new_col_B_name)
AS
(SELECT col_name_A, 
        col_name_B FROM tableA) -- This is the CTE query definition

SELECT new_col_A_name, new_col_B_name FROM tableA_CTE
--

-- Create a double CTE
WITH
tableA_CTE (new_col_A_name, new_col_B_name) AS
(SELECT col_name_A, 
        col_name_B FROM tableA)
, 
tableB_CTE (new_col_C_name, new_col_D_name) AS
(SELECT col_name_C, 
        col_name_D FROM tableB)

SELECT  new_col_A_name, 
        new_col_B_name,
        new_col_C_name
FROM tableA_CTE
INNER JOIN
tableB_CTE
ON tableA_CTE.new_col_A_name = tableB_CTE.new_col_C_name
--

---- Filtering Data ----

--
SELECT * FROM table_name
    WHERE col_name_A = 'this is what I want'
    WHERE col_name_A IN ('itemA', 'itemB')
    WHERE col_name_A NOT IN ('itemA', 'itemB')
    WHERE col_name_A = 'itemA' OR col_name_A = 'itemB'
    WHERE col_name_A > 99
    WHERE col_name_A <>
    WHERE col_name_A IS NULL
    WHERE col_name_A IS NOT NULL
--

--
SELECT * FROM table_name
    WHERE NOT col_name_A = 'Berlin' -- Return everything not Berlin
--

-- Filtering for null or non-null values
SELECT * FROM table_name
    WHERE col_name_A IS NULL 
    WHERE col_name_A IS NOT NULL
--

--
SELECT * FROM table_name
    WHERE col_name_A BETWEEN 99 AND 999
    WHERE col_name_A NOT BETWEEN 99 AND 999
--

-- RegEx
SELECT * FROM table_name
    WHERE col_name_A LIKE 'Mar%' -- % represent any number of characters and is NOT case sensitive
    WHERE col_name_A LIKE 'Mar_' -- underscore('_') represent a single random character
    WHERE col_name_A LIKE 'G\_007' -- \ is an escape key
--

--
SELECT * FROM table_name
    WHERE col_name_A LIKE '[acs]%' -- select all records where the first letter is "a", "c" or "s"
    WHERE col_name_A LIKE '[!acs]%' -- select all records where the first letter is NOT "a", "c" or "s"
    WHERE col_name_A LIKE '[a-f]%' -- select all records where the first letter is "a" to "f"
--

---- Grouping Data ----

--
SELECT col_name_A, SUM(col_name_C) FROM table_name
GROUP BY col_name_A
HAVING SUM(col_name_C) > 999
--

---- Partitioning Data ----

--
SELECT 
    col_name_A,
    SUM(col_name_B) OVER (PARTITION BY col_name_C)
FROM tableA
--

---- Conditional Columns ----

--
SELECT 
    col_name_A, 
    col_name_B,
    (CASE
        WHEN col_name_A > 99 THEN 'High'
        WHEN col_name_A BETWEEN 999 AND 9999 THEN 'Very High'
        ELSE 'Everything else'
        END
        ) AS my_name_for_cal_col
FROM table_name
--

---- Join Data ----

--
SELECT tableA.col_name_A , tableB.col_name_B FROM
tableA
INNER JOIN -- {FULL JOIN, LEFT JOIN, CROSS JOIN}
-- INNER JOIN AND JOIN HAS THE SAME MEANING
tableB
ON tableA.col_name_C = tableB.col_name_C
--

-- UNION
SELECT col_name_A, col_name_B FROM tableA
UNION -- will remove duplicated rows
SELECT col_name_A, col_name_B FROM tableB
--

-- UNION ALL
SELECT * FROM tableA
UNION ALL -- preserve duplicated rows
SELECT * FROM tableB
--

---- USEFUL FUNCTIONS ----

-- Sorting
SELECT col_name_A, col_name_B FROM table_name
ORDER BY col_name_A ASC, col_name_B DESC
--

--
SELECT * FROM table_name
ORDER BY col_name_A, col_name_B -- This will sort the result alphabetically first by col_name_A then col_name_B
--

-- Limit the number of returned rows
SELECT TOP 5 * FROM table_name
SELECT TOP 5 col_name_A, col_name_B FROM table_name
--

-- Extract distinct values
SELECT DISTINCT(col_name_A) FROM table_name
--

-- Extract sub string from a value
SELECT col_name_A, SUBSTRING(col_name_B,1,3) FROM tableA
--

-- To replace values in a value
SELECT col_name_A, REPLACE(col_name_B, 'to_replace_this', 'replace_with_this') FROM tableA
--

-- To transform values to upper/lower case
SELECT col_name_A, UPPER(col_name_B) FROM tableA
SELECT col_name_A, LOWER(col_name_B) FROM tableA

-- Apply simple math over a column
SELECT(col_name_A * 99), col_name_B FROM table_name
--

-- Concat columns
SELECT CONCAT(col_name_A, col_name_B) FROM table_name
--

-- Return the number of row items
SELECT COUNT(*) FROM table_name
--

---- END ----