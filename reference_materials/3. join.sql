/* 
Type of Joins
- JOIN = INNER JOIN- 
- LEFT JOIN = LEFT OUTER JOIN
- RIGHT JOIN = RIGHT OUTER JOIN
-  FULL JOIN = FULL OUTER JOIN
- NATURAL JOIN 
- CROSS JOIN
- SELF JOIN

--- SELF JOIN ---
A self join is a table joining on itself. Use JOIN as the key word for SELF JOIN operation.

--- CROSS JOIN ---
For every record in the left table, it will match with all records on the right table
CROSS JOIN can be used to retrieve information where there is no common keys

--- NATURAL JOIN ---
- NATURAL JOIN lets SQL decide which column to join on based on the column name 
- If there are no columns that are sharing the same name, SQL will do a CROSS JOIN
- And if there are multiple columns from both tables that share the same name, SQL will use the said multiple columns to join
- Result set behaviour is similar to INNER JOIN
*/

SELECT tableA.col_name_A , tableB.col_name_B FROM
tableA
LEFT JOIN
tableB
ON tableA.col_name_C = tableB.col_name_C -- this is not required if CROSS JOIN or NATURAL JOIN

