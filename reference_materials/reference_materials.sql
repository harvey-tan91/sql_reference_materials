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
ADD EmployeeAddress VARCHAR(255) DEFAULT 'JAPAN'

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

An updatable view is when you update the view, you update the original table where the view is referencing from
2. Updatable views cannot include
--- Aggregate functions
--- Group By
--- Having
--- UNION
--- DISTINCT
--- {LEFT JOIN, RIGHT JOIN, OUTER JOIN}
--- SUBQUERIES

Notes:
-- Creating a view will store the structure of the original table that was used to create the view
-- If there is a change in the structure of the original table used to create the view, it will not get captured in the view

*/

--
CREATE VIEW sample_view_name AS
SELECT * FROM tableA
    WHERE col_name_A > '1 Jan 2021'
WITH CHECK OPTION -- this will ensure that any insert operation into the view fulfilled the where conditions 

-- 

--
ALTER VIEW sample_view_name AS
SELECT * FROM tableA
    WHERE col_name_A > '1 June 2021'
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
        (SELECT col_name_A, col_name_B FROM tableA) , 

    tableB_CTE (new_col_C_name, new_col_D_name) AS
        (SELECT col_name_C, col_name_D FROM tableB)
SELECT  
    t1.new_col_A_name, 
    t1.new_col_B_name,
    t2.new_col_C_name
FROM tableA_CTE as t1
INNER JOIN tableB_CTE t2
ON t1.new_col_A_name = t2.new_col_C_name
--

--
with 
	total_sales_cte (store_id, total_sales_per_store) as
		(
		select s.store_id, sum(s.cost) as total_sales_per_store
		from sales s
		group by s.store_id
		),
	avg_sales_cte (average_sales_across_all_store) as
		( 
		select AVG(tbl.total_sales_per_store) as avg_sales_from_all_stores from 
		total_sales_cte tbl
		)
select * 
from total_sales_cte t1, avg_sales_cte av
where t1.total_sales_per_store > av.average_sales_across_all_store

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

---- Window Functions ----

--
SELECT 
    col_name_A,
    SUM(col_name_B) OVER (PARTITION BY col_name_C),
    COUNT(col_name_B) OVER (PARTITION BY col_name_C),
    MAX(col_name_B) OVER (PARTITION BY col_name_C),
    AVG(col_name_B) OVER (PARTITION BY col_name_C),
FROM tableA
--

--
SELECT *, 
    ROW_NUMBER() OVER (PARTITION BY DepartmentName ORDER BY EmployeeID)
    -- This creates a distinct row number over the department window of rows and order by the EmployeeID
FROM 
    EmployeeListing
--

--
SELECT *, 
    RANK() OVER (PARTITION BY DepartmentName ORDER BY Salary),
    -- This creates a rank number based on the salary in the department
    DENSE_RANK() OVER (PARTITION BY DepartmentName ORDER BY Salary)
FROM 
    EmployeeListing
--

--
SELECT *,
    LAG(Salary) OVER (PARTITION BY DepartmentName ORDER BY EmployeeID) as previous_emp_salary,
    -- This creates a column that contains the previous 1 employee salary based on the ordering of the EmployeeID

    LAG(Salary,2,0) OVER (PARTITION BY DepartmentName ORDER BY EmployeeID) as previous_emp_salary,
    -- This looks at the previous 2 employees with default value equals to 0 if there is no two previous employees

    LEAD(Salary) OVER (PARTITION BY DepartmentName ORDER BY EmployeeID) as next_emp_salary,
    -- This creates a column that contains the next 1 employee salary based on the ordering of the EmployeeID

    LEAD(Salary,2,0) OVER (PARTITION BY DepartmentName ORDER BY EmployeeID) as next_emp_salary
    -- This looks at the next 2 employees with default value equals to 0 if there is no two next employees
FROM 
    EmployeeListing
--

--
SELECT *, 
    FIRST_VALUE(product_name) over (partition by product_category order by price DESC) as most_expensive_product,
        -- This creates a column that contain the first value of the product_name column based on the highest price product in the product_category

    LAST_VALUE(product_name) over 
        (partition by product_category order by price DESC
        range between unbounded preceding and current row
        ) -- This is the default frame when using the LAST_VALUE function
        -- During the iteration within the window, the record will look at the first record and the current record to pull out the last value
        -- It does not look at all the records within the same window 
        AS least_expensive_product,

    LAST_VALUE(product_name) over 
        (partition by product_category order by price DESC
        range between unbounded preceding and current unbounded following) 
        -- This will allow all the records to be taken into consideration within the same window
        AS least_expensive_product,

    NTH_VALUE(product_name, 2) over
        (PARTITION by product_category order by price DESC
        range between unbounded preceding and current row -- This is the default frame
        )    
        -- NTH_VALUE function is not available in MS SQL 
        -- This wiLL display the 2th value in the said window

    NTILE(3) OVER
        (PARTITION BY product_category ORDER BY price DESC)
        -- This create 3 distinct buckets within the window  

    CUME_DIST() OVER (ORDER BY price DESC) AS price_cumu_dist
        -- This will create a cumulative distribution value column based on the price column

FROM 
    product
--

---- Correlated Subqueries ----
/*
In correlated subqueries, for every record in the main query, the sub-query is executed as well
Unlike in most subquery statmenets, where the subquery gets executed first, the main query gets executed first in a correlated subquery

*/ 

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

n

---- Join Data ----

--
SELECT tableA.col_name_A , tableB.col_name_B FROM
tableA
JOIN
tableB
ON tableA.col_name_C = tableB.col_name_C -- this is not required if CROSS JOIN or NATURAL JOIN

-- Type of Joins
-- LEFT JOIN = LEFT OUTER JOIN
-- RIGHT JOIN = RIGHT OUTER JOIN
-- JOIN = INNER JOIN
-- FULL JOIN = FULL OUTER JOIN
-- NATURAL JOIN 
-- CROSS JOIN
-- SELF JOIN

--- SELF JOIN---
-- Use JOIN as the key word for SELF JOIN

---CROSS JOIN---
-- CROSS JOIN, for every record in the left table, it will match with all records on the right table
-- CROSS JOIN can be used to retrieve information where there is no common keys

---NATURAL JOIN---
-- NATURAL JOIN lets SQL decide which column to join on based on the column name 
-- If there are no columns that are sharing the same join, SQL will do a CROSS JOIN
-- And if there are multiple columns from both tables that share the same name, SQL will use the said multiple columns to join
-- Result set behaviour is similar to INNER JOIN

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