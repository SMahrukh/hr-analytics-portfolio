
# HR Analytics Portfolio Project

**Author:** Syeda Mahrukh  
**Tools Used:** Python, SQL Server, Power BI  
**Dataset:** IBM HR Analytics Employee Attrition & Performance  
**Focus:** Data cleaning, analysis, and visualization of HR data to support strategic decisions

---

## Project Overview

This project demonstrates end-to-end HR data analysis using a real-world dataset. The goal is to:
- Clean and structure raw HR data
- Analyze workforce trends such as attrition, satisfaction, and compensation
- Visualize insights to support data-driven HR decision-making

---

## Project Phases

1. **Planning & Setup (Notion)**
2. **Data Collection**
3. **Data Cleaning (Python)**
4. **Database Creation & Querying (SQL)**
5. **Visualization & Dashboarding (Power BI)**
6. **Documentation & GitHub Publishing**

---

## Data Cleaning Steps

Performed in Python (`data_cleaning.ipynb`) on `unclean_hr_data.csv`:
- Removed null values in `Age`, `MonthlyIncome`, `TotalWorkingYears`
- Fixed inconsistent department names
- Removed duplicates
- Converted `MonthlyIncome` from text to numeric
- Dropped irrelevant column `RandomNotes`

Cleaned file saved as `clean_hr_data.csv`.

---

## Key Metrics 

### Attrition Analysis
- Overall Attrition Rate
- Attrition by Department & Job Role
- Attrition by Gender & Education Field
- Attrition by Gender & Age Group
- Attrition by Overtime and WorkLife Balance

### Compensation Analysis
- Average salary by job role and level
- Gender pay gap by job level

### DEI & Diversity Insights
- Gender distribution by department
- Tenure vs Job Satisfaction

### Performance & Career Progression
- Are High performers leaving
- Performance vs YearsSinceLastPromotion

### Satisfaction & Tenure Analysis
- Job satisfaction vs attrition
- Average Years at Company by Department

---

## Visualizations : Power BI 

The dashboard I created brings HR data to life with a mix of clear KPIs and powerful visualizations designed to highlight key workforce patterns and concerns.

I used **KPI cards** at the top to summarize the essentials — total number of employees, overall attrition rate, average monthly salary, and average tenure. These help set the stage for all the deeper insights that follow.

A **stacked column chart** breaks down attrition by both department and gender — making it easy to spot which teams are facing the highest turnover, and whether it differs across male and female employees.

For compensation insights, I used a **dumbbell column chart** to show the range of salaries (minimum and maximum) across job levels, helping visualize income progression and fairness.

A **treemap** visualizes employee distribution by job role, giving a quick sense of where most of the workforce is concentrated.

The **donut chart** captures the gender distribution in the organization, providing a snapshot of diversity at a glance.

To explore the impact of employee experience, a **clustered bar chart** compares work-life balance scores against attrition rates — helping understand if burnout might be driving turnover.

Department-wise satisfaction is visualized using a **stacked bar chart**, making it easier to compare which teams feel more engaged and which might need support.

Finally, I used a **scatter plot** to look at the relationship between tenure (Total Working Years) and Monthly Income — to see if staying longer with the company really pays off.

Together, these visuals tell a story of where the organization stands — and what areas leaders should focus on next.

---

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas) | Data cleaning, transformation, and basic exploration |
| SQL Server | Data modeling, querying, and aggregating HR metrics |
| Power BI | Dashboarding and storytelling with interactive visuals |
| Notion | Project planning and task management |
| GitHub | Hosting, documentation, and version control |

---

## Files in This Repository

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
├── README.md
```
---

## Project Story

As part of this HR analytics portfolio project, I explored trends in attrition, compensation, satisfaction, performance, and diversity using real-world data and tools like Python, SQL, and Power BI. Here's what stood out:

- **Attrition is above global averages (16.20%)**, and it's highest among *Sales Representatives*, *Lab Technicians*, and *HR staff*. These roles may require closer attention to workload, support, or career paths.

- **Young employees, especially women under 25, are leaving at alarming rates** — 50% of young female hires left the company. This signals a gap in early-career support and retention strategies.

- **Compensation increases as expected by job level**, and the **pay gap between men and women is minimal**, which is reassuring. It’s great to see fairness in pay, but role-based variations still exist.

- **Some departments still have gender imbalances**, including HR being predominantly male — which was unexpected and worth reflecting on in terms of hiring practices.

- **Job satisfaction clearly impacts retention**. Those with the lowest satisfaction had a 22.63% attrition rate, while the most satisfied employees were far more likely to stay.

- **Performance and promotion don’t always align**. Many top-rated employees (rating 3 or 4) haven’t been promoted in 5+ years — highlighting a missed opportunity for talent development.

This project helped me build a dashboard that not only visualizes data but also tells a story — one that HR leaders can act on to drive retention, equity, and engagement.

---

## About Me

Hi, I’m **Syeda Mahrukh**, an HR professional with international experience across Canada and the UAE. I’m currently building HR analytics expertise to bridge people strategy with data-driven decisions.

Feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/syeda-mahrukh/) or check out my portfolio at [GitHub](https://github.com/SMahrukh/hr-analytics-portfolio/tree/main).
