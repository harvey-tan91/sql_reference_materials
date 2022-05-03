
---- Creating Stored Procedures ----
GO
CREATE PROCEDURE name_of_my_sp
AS
SELECT * FROM tableA

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


---- Correlated Subqueries ----
/*
In correlated subqueries, for every record in the main query, the sub-query is executed as well
Unlike in most subquery statmenets, where the subquery gets executed first, the main query gets executed first in a correlated subquery

*/ 





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