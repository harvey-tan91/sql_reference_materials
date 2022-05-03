/*
1. CTEs, common table expressions (sub-query factoring), are created using the WITH clause

2. CTEs are basically temp result set of a sql statement

3. The queries in the CTE are executed first AND the result sets are stored temporarily for the rest of the sql execution

4. Good for breaking down complex queries into small chunks 

5. Good for filtering down a large dataset

*/


WITH 
	weather_cte (id, city, temperature, d_day, flag) AS
	(
	SELECT *,
		(CASE
			WHEN w.temperature < 0 THEN 'yes' ELSE 'no'
		END
		) flag
	FROM weather w
	),

	weather_flag_cte (id, city, temperature, d_day, flag, flag_plus1, flag_plus2, flag_minus1, flag_minus2) AS
	(
	SELECT *,
		lead(flag, 1) OVER(ORDER BY id) AS flag_plus1,
		lead(flag, 2) OVER(ORDER BY id) AS flag_plus2,
		lag(flag, 1) OVER(ORDER BY id) AS flag_minus1,
		lag(flag, 2) OVER(ORDER BY id) AS flag_minus2

	FROM weather_cte
	)

SELECT * FROM weather_flag_cte t1
WHERE 
(t1.flag = t1.flag_plus1 AND t1.flag = t1.flag_plus2) OR  
(t1.flag = t1.flag_minus1 AND t1.flag = t1.flag_plus1) OR 
(t1.flag = t1.flag_minus1 AND t1.flag = t1.flag_minus2) 

