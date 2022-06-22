/*
- The GROUP BY statement group the records and aggregates the records based on the stated aggregation function
- HAVING clause can be used to filter the aggregate result
*/

SELECT dept_name, AVG(salary) as avg_salary
FROM employee
GROUP BY dept_name
    HAVING AVG(salary) > 5000
    

-- Multiple columns can be stated in the GROUP BY clause for a more granular breakdown 
SELECT CustState, CustCity, COUNT(*) as frequency
FROM customers
GROUP BY CustState, CustCity
    ORDER BY CustState, COUNT(*) DESC 


-- The ROLLUP keyword can be used to derive the grand total figure
SELECT dept_name, SUM(salary) 
FROM employee
GROUP BY dept_name WITH ROLLUP

SELECT CustState, CustCity, COUNT(*) as frequency
FROM customers
GROUP BY CustState, CustCity WITH ROLLUP -- This will give us sub totals at the CustState level and the grand total 
    ORDER BY CustState, COUNT(*) DESC


-- The GROUPING SETS clause can also be used for aggregation
SELECT e.dept_name, AVG(e.salary) FROM 
employee e
GROUP BY GROUPING SETS
	(
	(e.dept_name), -- This is grouping by dept_name
	() -- This generates the grand total figure
	)


SELECT CustState, CustCity, COUNT(*) as frequency
FROM customers
GROUP BY GROUPING SETS
	(
		(CustState, CustCity), -- This give us the figure if we group by CustState AND CustCity
		(CustState), -- This will give us the sub totals at the CustState level
		() -- This will give us the grant total
	)


SELECT CustState, CustCity, COUNT(*) as frequency
FROM customers
GROUP BY GROUPING SETS
	(
		CustState, -- This give us the figure if we group by CustState 
		CustCity, 
		()
	)


