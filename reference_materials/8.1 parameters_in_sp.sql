/*
For single parameter
*/

CREATE PROCEDURE sp_emp_list
				(
				@age_limit AS INT = 25 -- We are defining one parameter/variable here where the default value is 25
				)
AS
BEGIN
	SELECT * FROM EmployeeListing
	WHERE Age > @age_limit
END

EXEC sp_emp_list 30 -- 30 is the value of the first parameter
EXEC sp_emp_list @age_limit= 30 -- This will make it easier to understand

/*
For multiple parameters and optional parameters
*/

GO
ALTER PROCEDURE sp_emp_list
				(
				@age_limit AS INT = 25, -- default to 25
				@gender AS VARCHAR(255) = NULL -- If we are defining the default to be NULL,  we need to address it in the WHERE clause
                -- @gender is an optional parameter
				)
AS
BEGIN
	SELECT * FROM EmployeeListing
	WHERE 
        Age > @age_limit AND 
        (@gender IS NULL OR Gender = @gender) -- We need to define the @gender IS NULL as the we are defining the default value to be NULL
END

EXEC sp_emp_list 30, 'Male' -- To execute stored procedure with multiple parameters
EXEC sp_emp_list @age_limit= 30, @gender= 'Male'