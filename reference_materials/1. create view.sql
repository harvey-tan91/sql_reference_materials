/* 
1. Views are virtual tables based on the result set of a saved sql statement.

2. Views always stay up to date when new records are inserted into the original table where the views are created from.

3. An updatable view is when you update a record in the view, you update the same record in the original table where the view is referencing from.
Updatable views cannot include the following clauses in the sql statement that was used to create the view,
--- Aggregate functions
--- Group By
--- Having
--- UNION
--- DISTINCT
--- {LEFT JOIN, RIGHT JOIN, OUTER JOIN}
--- SUBQUERIES

4. Creating a view will store the structure of the original table that was used to create the view.
If there is a change in the structure of the original table used to create the view, it will not get captured in the view.

5. Why use a view?
--- Security: Prevent the end users to see the structure of the tables used to create the view, or the query that is used to create the view
--- Simplify complex sql queries

*/


CREATE VIEW view_name AS
SELECT * FROM tableA
    WHERE department = 'admin'
WITH CHECK OPTION -- this will ensure that any insert operation into the view fulfilled the where conditions  
