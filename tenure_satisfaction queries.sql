--TRAINING, SATISFACTION & TENURE

--Job satisfaction vs attrition

SELECT
	s.JobSatisfaction,
	a.Attrition,
	COUNT(*) AS Num_of_People
FROM Satisfaction s
JOIN Attrition a ON s.EmployeeID = a.EmployeeID
GROUP BY s.JobSatisfaction, a.Attrition
ORDER BY a.Attrition desc;

WITH SatisfactionCounts AS (
    SELECT
        s.JobSatisfaction,
        COUNT(*) AS TotalEmployees,
        SUM(CASE WHEN a.Attrition = 1 THEN 1 ELSE 0 END) AS Leavers
    FROM Satisfaction s
    JOIN Attrition a ON s.EmployeeID = a.EmployeeID
    GROUP BY s.JobSatisfaction
)

SELECT
    JobSatisfaction,
    TotalEmployees,
    Leavers,
    ROUND(CAST(Leavers AS FLOAT) / TotalEmployees * 100, 2) AS AttritionRate
FROM SatisfactionCounts
ORDER BY JobSatisfaction DESC;  -- High to low satisfaction


--Avg years at company by department

SELECT
	jd.Department,
	AVG(t.YearsAtCompany) as AvgTenure
FROM JobDetails jd
JOIN Tenure t ON t.EmployeeID = jd.EmployeeID
GROUP BY jd.Department
ORDER BY AvgTenure desc;

	
