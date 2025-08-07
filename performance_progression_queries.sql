--PERFORMANCE & CAREER PROGRESSION

--Are high performers leaving?

SELECT
	p.PerformanceRating,
	CAST(ROUND(COUNT(CASE WHEN a.Attrition = 1 THEN 1 END) * 100.0 / COUNT(*),2) AS DECIMAL(5,2)) AS AttitionRate
FROM Performance p
JOIN Attrition a ON p.EmployeeID = a.EmployeeID
GROUP BY p.PerformanceRating
ORDER BY AttitionRate desc;

--Performance vs YearsSinceLastPromotion

SELECT
	t.YearsSinceLastPromotion,
	p.PerformanceRating,
	COUNT(*) AS COUNT
FROM Performance p
JOIN Tenure t ON p.EmployeeID = t.EmployeeID
GROUP BY p.PerformanceRating, t.YearsSinceLastPromotion
ORDER BY p.PerformanceRating desc;

SELECT
	p.PerformanceRating,
	CASE
		WHEN t.YearsSinceLastPromotion < 2 THEN 'Recently Promoted'
		WHEN t.YearsSinceLastPromotion BETWEEN 2 AND 5 THEN 'Promoted between 2 and 5 years'
		ELSE '5+ years without promotion'
	END AS PromotionGroup,
	COUNT(*) AS Num_of_Emp
	FROM Performance p
JOIN Tenure t ON p.EmployeeID = t.EmployeeID
GROUP BY p.PerformanceRating,
CASE
		WHEN t.YearsSinceLastPromotion < 2 THEN 'Recently Promoted'
		WHEN t.YearsSinceLastPromotion BETWEEN 2 AND 5 THEN 'Promoted between 2 and 5 years'
		ELSE '5+ years without promotion'
		END
ORDER BY p.PerformanceRating;

	(