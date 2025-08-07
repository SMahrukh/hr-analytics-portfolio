Use HRPortfolio
GO;

--Attrition & Retention Analysis

--Overall Attrition Rate

SELECT 
	CAST(ROUND(COUNT(CASE WHEN Attrition = 1 THEN 1 END) * 100.0 / COUNT(*),2) AS decimal(5,2)) AS ATTRITIONRATE
FROM Attrition;

--Attrition rate by department & Job Role

SELECT
	jd.Department,
	jd.JobRole,
	CAST(ROUND(COUNT(CASE WHEN a.Attrition = 1 THEN 1 END) * 100.0 / count(*),2) AS DECIMAL(5,2)) AS AttritionRate
FROM Attrition a
JOIN JobDetails jd ON a.EmployeeID = jd.EmployeeID
GROUP BY jd.Department, jd.JobRole
ORDER BY AttritionRate DESC;

--Attrition by gender and education field

SELECT
	jd.EducationField,
	e.Gender,
	CAST(ROUND(COUNT(CASE WHEN a.Attrition = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS decimal(5,2)) AS AttritionRate
from Attrition a
JOIN JobDetails jd ON a.EmployeeID = jd.EmployeeID
JOIN Employees e ON a.EmployeeID = e.EmployeeID
GROUP BY Gender, EducationField
ORDER BY AttritionRate;

--Attrition by Gender and Age Group

SELECT
	e.Gender,
	CASE 
		WHEN e.Age < 25 THEN 'Under 25'
		WHEN e.Age BETWEEN 25 AND 34 THEN '25 - 34'
		WHEN e.Age BETWEEN 35 AND 44 THEN '35 - 44'
		WHEN e.Age BETWEEN 45 AND 54 THEN '45 - 54'
		ELSE '55+'
	END AS AgeGroup,
	CAST(ROUND(COUNT (CASE WHEN Attrition = 1 THEN 1 END) * 100.0 / COUNT (*),2) AS DECIMAL(5,2)) AS AttritionRate
FROM Employees e
JOIN Attrition a ON e.EmployeeID = a.EmployeeID
GROUP BY e.Gender,
CASE 
	WHEN e.Age < 25 THEN 'Under 25'
	WHEN e.Age BETWEEN 25 AND 34 THEN '25 - 34'
	WHEN e.Age BETWEEN 35 AND 44 THEN '35 - 44'
	WHEN e.Age BETWEEN 45 AND 54 THEN '45 - 54'
	ELSE '55+'
END
ORDER BY e.Gender, AttritionRate DESC;

--Attrition by OverTime and WorkLifeBalance

SELECT
	s.Worklifebalance,
	a.OverTime,
	CAST(ROUND(COUNT(CASE WHEN a.Attrition = 1 THEN 1 END) * 100.0 / COUNT(*),2) AS decimal(5,2)) AS AttritionRate
FROM Satisfaction s
JOIN Attrition a ON s.EmployeeID = a.EmployeeID
GROUP BY s.Worklifebalance, a.OverTime
ORDER BY s.Worklifebalance,AttritionRate desc;











