use HRPortfolio;
GO
CREATE table Employees (EmployeeID INT PRIMARY KEY, Age INT, Gender Varchar(10), MaritalStatus Varchar(20));
GO
CREATE table JobDetailID (JobDetailID INT IDENTITY(1,1) PRIMARY KEY, 
							EmployeeID INT FOREIGN KEY REFERENCES Employees (EmployeeID),
							Department Varchar(50), 
							JobRole Varchar(50), 
							JobLevel INT, 
							Education INT, 
							EducationField Varchar(50), 
							BusinessTravel Varchar(50));
GO
CREATE table Compensation (CompensationID INT IDENTITY(1,1) PRIMARY KEY,
							EmployeeID INT FOREIGN KEY REFERENCES Employees (EmployeeID),
							MonthlyIncome DECIMAL(10,2),
							PercentSalaryHike INT,
							StockOptionLevel INT);
GO
CREATE table Performance (PerformanceID INT IDENTITY(1,1) PRIMARY KEY,
							EmployeeID INT FOREIGN KEY REFERENCES Employees (EmployeeID),
							PerformanceRating INT,
							JobInvolvement INT);
GO
CREATE table Satisfaction (SatisfactionID INT IDENTITY(1,1) PRIMARY KEY,
							EmployeeID INT FOREIGN KEY REFERENCES Employees (EmployeeID),
							JobSatisfaction INT,
							EnvironmentSatisfaction INT,
							RelationshipSatisfaction INT,
							Worklifebalance INT);
GO
CREATE table Tenure (TenureID INT IDENTITY(1,1) PRIMARY KEY,
						EmployeeID INT FOREIGN KEY REFERENCES Employees (EmployeeID),
						TotalWorkingYears INT,
						NumCompaniesWorked INT,
						YearsAtCompany INT,
						YearsInCurrentRole INT,
						YearsSinceLastPromotion INT,
						YearsWithCurrManager INT);
GO
CREATE table Attrition (AttritionID INT IDENTITY(1,1) PRIMARY KEY,
						EmployeeID INT FOREIGN KEY REFERENCES Employees (EmployeeID),
						Attrition VarChar(10),
						OverTime VarChar(10));
GO
CREATE TABLE Staging_HRData (
    EmployeeID INT,
    Age INT,
    Gender VARCHAR(10),
    MaritalStatus VARCHAR(20),
    Department VARCHAR(50),
    JobRole VARCHAR(50),
    JobLevel INT,
    Education INT,
    EducationField VARCHAR(50),
    BusinessTravel VARCHAR(50),
    MonthlyIncome DECIMAL(10,2),
    PercentSalaryHike INT,
    StockOptionLevel INT,
    PerformanceRating INT,
    JobInvolvement INT,
    JobSatisfaction INT,
    EnvironmentSatisfaction INT,
    RelationshipSatisfaction INT,
    WorkLifeBalance INT,
    TotalWorkingYears INT,
    NumCompaniesWorked INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT,
    Attrition VARCHAR(10),
    OverTime VARCHAR(10)
);
GO;

Drop table dbo.Staging_HRData;
GO;

INSERT INTO Employees (EmployeeID, Age, Gender, MaritalStatus)
SELECT DISTINCT
    EmployeeNumber,
    Age,
    Gender,
    MaritalStatus
FROM clean_hr_data;

INSERT INTO JobDetails (EmployeeID, Department, JobRole, JobLevel, Education, EducationField, BusinessTravel)
SELECT DISTINCT
    EmployeeNumber,
    Department,
    JobRole,
    JobLevel,
    Education,
    EducationField,
    BusinessTravel
FROM clean_hr_data;

INSERT INTO Performance (EmployeeID, PerformanceRating, JobInvolvement)
SELECT DISTINCT
    EmployeeNumber,
    PerformanceRating,
    JobInvolvement
FROM clean_hr_data;

INSERT INTO Satisfaction (EmployeeID, JobSatisfaction, EnvironmentSatisfaction, RelationshipSatisfaction, WorkLifeBalance)
SELECT DISTINCT
    EmployeeNumber,
    JobSatisfaction,
    EnvironmentSatisfaction,
    RelationshipSatisfaction,
    WorkLifeBalance
FROM clean_hr_data;

INSERT INTO Tenure (EmployeeID, TotalWorkingYears, NumCompaniesWorked, YearsAtCompany, YearsInCurrentRole, YearsSinceLastPromotion, YearsWithCurrManager)
SELECT DISTINCT
    EmployeeNumber,
    TotalWorkingYears,
    NumCompaniesWorked,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager
FROM clean_hr_data;

INSERT INTO Attrition (EmployeeID, Attrition, OverTime)
SELECT DISTINCT
    EmployeeNumber,
    Attrition,
    OverTime
FROM clean_hr_data;

INSERT INTO Compensation (EmployeeID, MonthlyIncome, PercentSalaryHike, StockOptionLevel)
SELECT 
    EmployeeNumber,
    MonthlyIncome,
    PercentSalaryHike,
    StockOptionLevel
FROM clean_hr_data;

GO;

 /*1. What is the overall attrition rate?*/

 /*Overall Attrition Rate*/


SELECT
	COUNT(CASE WHEN Attrition = 1 THEN 1 END) *100.0/ COUNT (*)
SELECT 
    COUNT(CASE WHEN Attrition = 1 THEN 1 END) * 100.0 / COUNT(*) AS AttritionRate
FROM Attrition;

/*Attrition Rate by Department and JobRole*/
SELECT 
    jd.Department,
    jd.JobRole,
    CAST(
        ROUND(
            COUNT(CASE WHEN a.Attrition = 1 THEN 1 END) * 100.0 / COUNT(*), 
            2
        ) AS DECIMAL (5,2)
    ) AS AttritionRate
FROM Attrition a
JOIN JobDetails jd ON a.EmployeeID = jd.EmployeeID
GROUP BY jd.Department, jd.JobRole
ORDER BY 
    jd.Department ASC,
    AttritionRate DESC;

/* Average Monthly Income by Job Level and Role */

SELECT 
    jd.JobLevel,
    jd.JobRole,
    CAST(ROUND(AVG(c.MonthlyIncome), 2) AS DECIMAL(10,2)) AS AvgIncome
FROM Compensation c
JOIN JobDetails jd ON c.EmployeeID = jd.EmployeeID
GROUP BY jd.JobLevel, jd.JobRole
ORDER BY jd.JobLevel;

/*Gender distribution across Job Levels*/

SELECT 
    e.Gender,
    jd.JobLevel,
    COUNT(*) AS Count
FROM Employees e
JOIN JobDetails jd ON e.EmployeeID = jd.EmployeeID
GROUP BY e.Gender, jd.JobLevel
ORDER BY jd.JobLevel;

/* Are top performers leaving?*/

SELECT 
    p.PerformanceRating,
    a.Attrition,
    COUNT(*) AS Count
FROM Performance p
JOIN Attrition a ON p.EmployeeID = a.EmployeeID
GROUP BY p.PerformanceRating, a.Attrition
ORDER BY p.PerformanceRating;

--Attrition Rate by Performance Rating

SELECT 
    p.PerformanceRating,
    CAST(
		ROUND(
		 COUNT(CASE WHEN a.Attrition = 1 THEN 1 END) * 100.0 
        / COUNT(*), 2) AS decimal(5,2)
    ) AS AttritionRate
FROM Performance p
JOIN Attrition a ON p.EmployeeID = a.EmployeeID
GROUP BY p.PerformanceRating
ORDER BY p.PerformanceRating;

--Does training or job satisfaction reduce attrition?

SELECT
		s.JobSatisfaction,
		t.YearsAtCompany,
		a.Attrition,
		COUNT(*) AS COUNT
FROM Satisfaction s
JOIN Tenure t ON s.EmployeeID = t.EmployeeID
JOIN Attrition a ON s.EmployeeID = a.EmployeeID
GROUP BY s.JobSatisfaction, t.YearsAtCompany, a.Attrition
ORDER BY s.JobSatisfaction DESC;

SELECT 
    s.JobSatisfaction,
    CASE 
        WHEN t.YearsAtCompany BETWEEN 0 AND 2 THEN '0–2 years'
        WHEN t.YearsAtCompany BETWEEN 3 AND 5 THEN '3–5 years'
        WHEN t.YearsAtCompany BETWEEN 6 AND 10 THEN '6–10 years'
        ELSE '11+ years'
    END AS YearsAtCompanyRange,
    CAST( ROUND(
        COUNT(CASE WHEN a.Attrition = 1 THEN 1 END) * 100.0 / COUNT(*), 
        2) AS decimal(5,2)
    ) AS AttritionRate
FROM Satisfaction s
JOIN Tenure t ON s.EmployeeID = t.EmployeeID
JOIN Attrition a ON s.EmployeeID = a.EmployeeID
GROUP BY 
    s.JobSatisfaction,
    CASE 
        WHEN t.YearsAtCompany BETWEEN 0 AND 2 THEN '0–2 years'
        WHEN t.YearsAtCompany BETWEEN 3 AND 5 THEN '3–5 years'
        WHEN t.YearsAtCompany BETWEEN 6 AND 10 THEN '6–10 years'
        ELSE '11+ years'
    END
ORDER BY s.JobSatisfaction DESC, YearsAtCompanyRange;

--Work-Life Balance vs OverTime and Attrition

SELECT 
    s.WorkLifeBalance,
    a.OverTime,
    a.Attrition,
    COUNT(*) AS Count
FROM Satisfaction s
JOIN Attrition a ON s.EmployeeID = a.EmployeeID
GROUP BY s.WorkLifeBalance, a.OverTime, a.Attrition
ORDER BY s.WorkLifeBalance;

--Average Tenure by Department

SELECT 
    jd.Department,
    AVG(t.YearsAtCompany) AS AvgYears
FROM Tenure t
JOIN JobDetails jd ON t.EmployeeID = jd.EmployeeID
GROUP BY jd.Department
ORDER BY AvgYears DESC;