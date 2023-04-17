DROP PROCEDURE IF EXISTS sp_emp_list
GO
CREATE PROCEDURE sp_emp_list
				(
				@age_limit AS INT = 25, -- We are defining one parameter/variable here where the default value is 25
				@num_of_emp AS INT OUTPUT -- We are defining this parameter as an output parameter
                )
AS

BEGIN
	
    SELECT * FROM EmployeeListing
	WHERE Age > @age_limit

END