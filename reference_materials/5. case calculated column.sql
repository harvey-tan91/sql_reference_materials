SELECT *,
	(CASE
		WHEN SALARY > 8000 THEN 'High'
		WHEN SALARY BETWEEN 5000 AND 8000 THEN 'Mid'
		ELSE 'Regular'
	END
	) new_column_name
FROM employee
