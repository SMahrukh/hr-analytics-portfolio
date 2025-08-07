--DEI & DIVERSITY INSIGHTS

--Gender distribution by department

SELECT
	jd.Department,
	e.Gender,
	COUNT(*) AS Num_of_Emp
FROM Employees e
JOIN JobDetails jd ON e.EmployeeID = jd.EmployeeID
GROUP BY jd.Department,e.Gender
ORDER BY jd.Department DESC;

--Tenure vs satisfaction: Long-term engagement view

SELECT
	s.JobSatisfaction,
	CASE
		WHEN t.TotalWorkingYears between 0 AND 4 THEN '0 - 4 yrs'
		WHEN t.TotalWorkingYears between 5 AND 9 THEN '5 - 9 yrs'
		WHEN t.TotalWorkingYears between 10 AND 14 THEN '10 - 19 yrs'
		WHEN t.TotalWorkingYears between 15 AND 19 THEN '20 - 29 yrs'
		ELSE '30+ yrs'
	END AS ServiceGroup,
	COUNT(*) AS Num_of_Emp
FROM Satisfaction s
JOIN Tenure t ON s.EmployeeID = t.EmployeeID
GROUP BY s.JobSatisfaction,
CASE
		WHEN t.TotalWorkingYears between 0 AND 4 THEN '0 - 4 yrs'
		WHEN t.TotalWorkingYears between 5 AND 9 THEN '5 - 9 yrs'
		WHEN t.TotalWorkingYears between 10 AND 14 THEN '10 - 19 yrs'
		WHEN t.TotalWorkingYears between 15 AND 19 THEN '20 - 29 yrs'
		ELSE '30+ yrs'
	END
ORDER BY ServiceGroup, s.JobSatisfaction;
