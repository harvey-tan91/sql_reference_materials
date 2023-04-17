-- Variable declaration
DECLARE @my_date AS DATETIME  
-- Setting a value to the declared variable
SET @my_date = '2022-05-01'

SELECT * FROM login_details
WHERE login_date >= @my_date -- use the "@" to refer to the variable

---------------------------------------

/*
-- The result of a select statement can be stored in a variable as well
*/
DECLARE @my_date AS DATETIME  
DECLARE @some_num AS INT

SET @my_date = '2022-05-01'
SET @some_num = (SELECT COUNT(*) FROM login_details WHERE login_date >= @my_date)

SELECT @some_num

/*
-- We can set multiple variables at one go
*/
DECLARE @var_login_id INT
DECLARE @var_user_name VARCHAR(MAX)
DECLARE @var_login_date DATETIME

SELECT TOP 1 -- the multiple variables are set here
		@var_login_id = t.login_id,
		@var_user_name = t.user_name,
		@var_login_date = t.login_date

FROM login_details AS t
WHERE t.login_date <= '2022-04-30'
ORDER BY t.user_name ASC

SELECT @var_login_id, @var_user_name, @var_login_date

/*
-- We can accumulate values in a variable as well
*/
DECLARE @some_num AS VARCHAR(MAX)
SET @some_num = ''

SELECT  
	@some_num = @some_num + t.user_name + ', '
FROM login_details t

SELECT @some_num

/*
There are global variables that are pre-defined 
Global variables have double "@@" sign
*/
SELECT @@VERSION
SELECT @@SERVERNAME














