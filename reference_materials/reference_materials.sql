
------------------------------------
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
CREATE VIEW sample_view_name AS
SELECT * FROM tableA
    WHERE col_name_A > '1 Jan 2021'
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
    WHERE col_name_A = 'itemA' OR col_name_A = 'itemB'
    WHERE col_name_A > 99
    WHERE col_name_A <>
    WHERE col_name_A IS NULL
    WHERE col_name_A IS NOT NULL
--

--
SELECT * FROM table_name
    WHERE col_name_A BETWEEN 99 AND 999
--

-- RegEx
SELECT * FROM table_name
    WHERE col_name_A LIKE 'Mar%' -- % represent any number of characters and is case sensitive
    WHERE col_name_A LIKE 'Mar_' -- underscore('_') represent a single random character
    WHERE col_name_A LIKE 'G\_007' -- \ is an escape key
--


---- Grouping Data ----

--
SELECT col_name_A, col_name_B, SUM(col_name_C) FROM table_name
GROUP BY col_name_A
HAVING SUM(col_name_A) > 999
--

---- Conditional Columns ----

--
SELECT 
    col_name_A, 
    col_name_B,
    CASE(
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
tableB
ON tableA.col_name_C = tableB.col_name_C
--

-- UNION
SELECT col_name_A, col_name_B FROM tableA
UNION
SELECT col_name_A, col_name_B FROM tableB
--


---- USEFUL FUNCTIONS ----

-- Sorting
SELECT col_name_A, col_name_B FROM table_name
ORDER BY col_name_A ASC, col_name_B DESC
--

-- Limit the number of returned rows
SELECT * FROM table_name
LIMIT 10
--

-- Extract distinct values
SELECT DISTINCT(col_name_A) FROM table_name
--

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