
--Average salary by job role and level

SELECT
	jd.JobRole,
	jd.JobLevel,
	CAST(ROUND(AVG(c.MonthlyIncome),2) AS decimal(9,2)) AS AvgSalary
FROM JobDetails jd
JOIN Compensation c ON jd.EmployeeID = c.EmployeeID
GROUP BY jd.JobRole, jd.JobLevel
ORDER BY AvgSalary DESC;

--Gender pay gap by job level

SELECT
	e.Gender,
	jd.JobLevel,
	CAST(ROUND(AVG(c.MonthlyIncome),2) AS decimal(9,2)) AS AvgSalary
FROM Employees e
JOIN JobDetails jd ON e.EmployeeID = jd.EmployeeID
JOIN Compensation c ON e.EmployeeID = c.EmployeeID
GROUP BY e.Gender, jd.JobLevel
ORDER BY AvgSalary DESC;

--Gender pay gap by job level

Select
	jd.JobLevel,
	ROUND(AVG(CASE WHEN e.Gender = 'Male' THEN c.MonthlyIncome END), 2) AS Avg_Male_Income,
	ROUND(AVG(CASE WHEN e.Gender = 'Female' THEN c.MonthlyIncome END), 2) AS Avg_Female_Income,
	CAST(ROUND(
			AVG(CASE WHEN e.Gender = 'Male' THEN c.MonthlyIncome END)
			- AVG(CASE WHEN e.Gender = 'Female' THEN c.MonthlyIncome END), 2) AS DECIMAL(5,2))
			AS PayGap,
	CAST(ROUND(
			AVG(CASE WHEN e.Gender = 'Male' THEN c.MonthlyIncome END) 
			- AVG(CASE WHEN e.Gender = 'Female' THEN c.MonthlyIncome END), 2) AS DECIMAL(5,2))
			AS GapPercent
FROM Employees e
JOIN JobDetails jd ON e.EmployeeID = jd.EmployeeID
JOIN Compensation c ON e.EmployeeID = c.EmployeeID
GROUP BY JobLevel
ORDER BY PayGap desc;