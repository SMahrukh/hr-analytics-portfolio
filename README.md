
# 📊 HR Analytics Portfolio Project

**Author:** Syeda Mahrukh  
**Tools Used:** Python (Pandas), SQL Server, Power BI  
**Dataset:** IBM HR Analytics Employee Attrition & Performance  
**Focus:** Data cleaning, analysis, and visualization of HR data to support strategic decisions

---

## 🧭 Project Overview

This project demonstrates end-to-end HR data analysis using a real-world dataset. The goal is to:
- Clean and structure raw HR data
- Analyze workforce trends such as attrition, satisfaction, and compensation
- Visualize insights to support data-driven HR decision-making

---

## 📂 Project Phases

1. **Planning & Setup**
2. **Data Collection**
3. **Data Cleaning (Python)**
4. **Database Creation & Querying (SQL)**
5. **Visualization & Dashboarding (Power BI)**
6. **Documentation & GitHub Publishing**

---

## 🧼 Data Cleaning Steps

Performed in Python (`data_cleaning.ipynb`) on `unclean_hr_data.csv`:
- Removed null values in `Age`, `MonthlyIncome`, `TotalWorkingYears`
- Fixed inconsistent department names
- Removed duplicates
- Converted `MonthlyIncome` from text to numeric
- Dropped irrelevant column `RandomNotes`

Cleaned file saved as `clean_hr_data.csv`.

---

## 🧠 Key Metrics & Business Questions

| Question | Metric / Insight |
|----------|------------------|
| What is the overall attrition rate? | % of employees who left |
| Which departments and job roles have the highest attrition? | Attrition by Department and JobRole |
| How does income vary by job level and role? | Average MonthlyIncome by JobLevel and JobRole |
| Are certain genders or education levels overrepresented in senior roles? | Distribution of Gender and Education across JobLevels |
| Do performance ratings correlate with attrition or promotion? | Cross-tab: PerformanceRating vs Attrition, YearsSinceLastPromotion |
| Are training and job satisfaction linked to employee retention? | TrainingTimesLastYear & JobSatisfaction vs Attrition |
| Which employees have the longest tenure with the same manager? | YearsWithCurrManager |
| Are work-life balance and overtime linked to attrition? | WorkLifeBalance, OverTime vs Attrition |
| How satisfied are employees in different departments? | EnvironmentSatisfaction, RelationshipSatisfaction by Department |

---

## 📊 Visualizations (Power BI or Python)

- **Bar Chart**: Attrition Rate by Department and Job Role
- **Pie Chart**: Gender or Marital Status Distribution
- **Boxplot**: Monthly Income by Job Level
- **Heatmap**: JobSatisfaction vs Attrition
- **Stacked Bar**: OverTime vs Attrition
- **Scatter Plot**: TotalWorkingYears vs MonthlyIncome
- **KPI Cards**: Avg Tenure, Avg Salary, Overall Attrition Rate
- **Treemap**: Employee Count by JobRole and Department

---

## 🧰 Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas) | Data cleaning, transformation, and basic exploration |
| SQL Server | Data modeling, querying, and aggregating HR metrics |
| Power BI | Dashboarding and storytelling with interactive visuals |
| Notion | Project planning and task management |
| GitHub | Hosting, documentation, and version control |

---

## 📝 Files in This Repository

```
├── data/
│   ├── raw_hr_data.csv
│   └── clean_hr_data.csv
├── python/
│   └── data_cleaning.ipynb
├── sql/
│   ├── ddl_create_tables.sql
│   ├── dml_insert_data.sql
│   └── queries_analysis.sql
├── dashboards/
│   └── hr_dashboard.pbix
│   └── screenshots/
├── erd/
│   └── hr_schema.png
├── README.md
```

---

## 📌 Project Status

- [x] Unclean dataset created and ready for cleaning
- [ ] Python notebook in progress
- [ ] SQL schema and sample data to be generated
- [ ] Dashboard planned
- [ ] Final GitHub upload pending

---

## 💬 Contact

Feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/syeda-mahrukh/) or check out my portfolio at [GitHub](https://github.com/SMahrukh/hr-analytics-portfolio/tree/main).
