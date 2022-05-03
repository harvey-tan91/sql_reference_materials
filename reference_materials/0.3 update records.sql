-- Updating data in table
UPDATE EmployeesListing
SET 
    EmployeeID = 1012, -- under the SET clause, is where we specify the values that we want to update 
    Age = 31, 
    Gender = 'Female' 
WHERE
    FirstName = 'Holly' AND LastName = 'Flax' -- this is the record which we want to update


