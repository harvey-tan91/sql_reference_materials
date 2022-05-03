/*
Based on the sqltutorial-windowsfunction database

-----------------
---- With reference to the employee table ----

-Fetch the second last record from the employee table

- Write a SQL query to display only the details of employees who either earn 
the highest salary or the lowest salary in each department from the employee table.

- Return the employee details with the 3rd highest salary

- For each employee, display the average salary in each department

- For each employee, advise if the employee salary is higher or lower than the department average

- For each employee, rank their salary in their own department

- Create a column in the original employee table to display the table average of the salary

- For each employee, advise if the employee salary is higher or lower than the global salary

- For each employee, find out if their salary is higher or lower than the previous employee based on the employee ID

- For each employee, find out if their salary is higher or lower than the next employee based on the employee ID

- Return all employees who earn the highest salary in each department 

- With reference to department tables, return all departments with no employees
Use a correlated query to answer this question
Use a subquery to anwser this question

- Return all the employees who earn higher than the average salary in their department
Use a correlated query to answer this question


---- With reference to the emp table ----

- Pull out all the employees with salary higher than the all average 
USE A CTE with this question


---- With reference to the sales table ----

- Pull out all the stores where the store total sales is higher than the average store sales
Use a CTE with this question

---- With reference to the users table ----

- Write a SQL query to fetch all the duplicate records from a table.


---- With reference to the doctors table ----

- From the doctors table, fetch the details of doctors 
who work in the same hospital but in different speciality.

- Now find the doctors who work in same hospital irrespective of their speciality.


---- With reference to the login_details table ----

- From the login_details table, fetch the users who logged in consecutively 3 or more times.


---- With reference to the students table ----

- From the students table, write a SQL query to interchange the adjacent student names.
Approach: Assuming id will be a sequential number always. 
If id is an odd number then fetch the student name from the following record. 
If id is an even number then fetch the student name from the preceding record. 
Try to figure out the window function which can be used to fetch the preceding the following record data. 
If the last record is an odd number then it wont have any adjacent even number, 
hence figure out a way to not interchange the last record data.

---- With reference to the weathers table ----

- From the weather table, 
fetch all the records when London had less than 0 degree for 3 consecutive days or more.

---- With reference to the parent table ----

- Write a query to fetch the child name and their age corresponding to their parent name and their parent age

---- With reference to the bank table ----

- Return the monthly deposit amount, along with
total deposit for the last month
total deposit for the same month last year
total deposit for the start of the year

- Return on a monthly basis the YTD deposit amount 



*/






