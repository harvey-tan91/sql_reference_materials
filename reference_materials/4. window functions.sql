/*
- A window function performs a specific function OVER a window/subset of records
*/

SELECT *,
	COUNT(*) OVER (PARTITION BY dept_name),
	COUNT(*) OVER(),
	SUM(Salary) OVER(),
	AVG(SALARY) OVER(),
	MAX(SALARY) OVER()
FROM employee


-- This creates a column with the maximum salary from each department
-- The PARTITION BY keyword is for the column to be used to divide the data into the different subset  
SELECT *,
    max(e.salary) OVER(PARTITION BY e.dept_name) AS dept_max_salary 
FROM employee e


-- ROW_NUMBER() creates a distinct row number over the stated window
-- ROW_NUMBER function require the ORDER BY function
SELECT *,
	ROW_NUMBER() OVER(PARTITION BY dept_name ORDER BY emp_id)
FROM employee


-- The DENSE_RANK and RANK require the ORDER BY function
SELECT *, 
	RANK() OVER(ORDER BY SALARY), 
	DENSE_RANK() OVER(ORDER BY SALARY)
FROM employee


-- The LEAD and LAG function require the ORDER BY function
-- By default, the offset value is 1 
SELECT *,
	LEAD(e.salary, 1) OVER(ORDER BY emp_id),
	LEAD(e.salary, 2) OVER(ORDER BY emp_id),
	LAG(e.salary, 2) OVER(ORDER BY emp_id)
FROM employee e


-- FIRST_VALUE function takes the first value in the column
-- The FIRST_VALUE function require the ORDER BY function
SELECT *, 
	FIRST_VALUE(emp_name) OVER(PARTITION BY dept_name ORDER BY emp_id) 	
FROM employee


-- LAST_VALUE function takes the last value in the column
-- The LAST_VALUE function require the ORDER BY function
/*
Below is the default setting for LAST_VALUE function
During the iteration within the window, the LAST_VALUE will look at the first record and the current record to pull out the last value
It does not look at all the records within the same window */
SELECT *, 
	LAST_VALUE(emp_name) OVER(PARTITION BY dept_name ORDER BY emp_id
                                RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)
FROM employee

SELECT *, 
	LAST_VALUE(emp_name) OVER(PARTITION BY dept_name ORDER BY emp_id
                                RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) 
                                -- This will allow all the records to be taken into consideration within the same window
FROM employee


/* 
The CUME_DIST and PERCENT_RANK functions require the ORDER BY function

CUME_DIST formula: current row number / total number of row
For duplicated records based on the ORDER BY function, it will take the row number of the last record

PERCENT_RANK formula: current row number - 1 / total number of row - 1
For duplicated records based on the ORDER BY function, it will take the row number of the first record
*/
SELECT *, 
	CUME_DIST() OVER (ORDER BY salary),
	PERCENT_RANK() OVER (ORDER BY salary)
FROM employee


-- NTILE will create equal-sized bucket, it will create a column with numbers indicating the bucket which the records sit in
-- The NTILE function require the ORDER BY function
SELECT *, 
	NTILE(3) OVER (ORDER BY salary)
FROM employee

